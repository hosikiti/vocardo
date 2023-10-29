import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/service/card/card_list_provider.dart';
import 'package:vocardo/core/service/card/current_card_provider.dart';
import 'package:vocardo/core/util/repetition_util.dart';
import 'package:vocardo/core/widget/dialog_widget.dart';
import 'package:vocardo/core/widget/recording_dialog_widget.dart';

import '../../core/service/card/card_service.dart';

class PracticePage extends ConsumerStatefulWidget {
  const PracticePage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PracticePageState();
}

class _PracticePageState extends ConsumerState<PracticePage> {
  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    final card = ref.watch(currentCardProvider);

    return Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: "delete",
                    child: const Text("Delete this card"),
                    onTap: () async {
                      final id = card.valueOrNull?.id;
                      if (id == null) {
                        return;
                      }

                      final yes = await showOkCancelDialog(context,
                          content: "Are you sure?", title: "Delete");
                      if (!yes) {
                        return;
                      }

                      final cardService =
                          await ref.read(cardServiceProvider.future);
                      await cardService.deleteCard(id);
                      ref.read(currentCardProvider.notifier).next();
                    },
                  ),
                ];
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
              child: card.when(data: (card) {
                if (card == null) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text("No cards to remember\nfor now!",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                  );
                }
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 180),
                  transitionBuilder: __transitionBuilder,
                  layoutBuilder: (widget, list) => Stack(children: [
                    if (widget != null) widget,
                    ...list,
                  ]),
                  child: _buildCard(card),
                );
              }, error: (_, __) {
                return const Text("Error");
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
            ),
            SizedBox(
              height: 64,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setCardNewInterval(1);
                      },
                      child: const Text("HARD"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setCardNewInterval(3);
                      },
                      child: const Text("OK"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setCardNewInterval(5);
                      },
                      child: const Text("EASY"),
                    ),
                  )
                ],
              ),
            )
          ]),
        ));
  }

  void setCardNewInterval(int quality) async {
    final currentCard = ref.read(currentCardProvider);
    final card = currentCard.valueOrNull;
    if (card == null) {
      return;
    }

    final cardService = await ref.read(cardServiceProvider.future);
    final item = await cardService.getItem(card.id);
    if (item == null) {
      return;
    }

    final rep = calculateRepetationInterval(
        repeatCount: (item.repetition ?? 0) + 1,
        quality: quality,
        lastEasinessFactor: item.easinessFactor,
        lastIntervalDays: item.interval);

    DateTime reviewAfter =
        DateTime.now().add(Duration(hours: rep.nextIntervalDays));

    await cardService.updateCardRepetition(
      card.id,
      repetition: rep.repeatCount,
      easinessFactor: rep.lastEasinessFactor,
      interval: rep.nextIntervalDays,
      quality: quality,
      reviewAfter: reviewAfter,
      lastReviewed: DateTime.now(),
    );

    if (ref.read(currentCardProvider.notifier).isLast()) {
      if (!mounted) {
        return;
      }
      Navigator.of(context).pop();
    }

    ref.read(currentCardProvider.notifier).next();
    setState(() {
      // show the back side randomly
      showAnswer = Random().nextBool();
    });
  }

  Widget _buildCard(CardItem card) {
    return Card(
        key: ValueKey("$showAnswer-${card.id}"),
        elevation: 24,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(showAnswer ? card.answer : card.question,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    showRecordingDialog(context);
                  },
                  icon: const Icon(Icons.mic),
                ),

                // Play button
                IconButton(
                  onPressed: () async {
                    AudioPlayer audioPlayer = AudioPlayer();
                    final cardService =
                        await ref.read(cardServiceProvider.future);
                    final audioData = await cardService.getSound(card.id);
                    if (audioData == null) {
                      return;
                    }
                    await audioPlayer
                        .play(BytesSource(Uint8List.fromList(audioData)));
                  },
                  icon: const Icon(Icons.volume_up),
                ),

                /// Recording button
                IconButton(
                  onPressed: () async {
                    setState(() {
                      showAnswer = !showAnswer;
                    });
                  },
                  icon: const Icon(Icons.replay),
                ),
              ],
            ),
          ],
        ));
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(showAnswer) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }
}
