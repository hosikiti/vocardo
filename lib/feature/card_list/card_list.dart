import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocardo/core/service/card/card_list_provider.dart';
import 'package:vocardo/core/service/card/practice_card_list_provider.dart';
import 'package:vocardo/core/service/study_set/current_study_set_provider.dart';
import 'package:vocardo/core/service/tts/tts_service.dart';
import 'package:vocardo/core/util/text_util.dart';
import 'package:vocardo/core/util/time_util.dart';
import 'package:vocardo/core/widget/dialog_widget.dart';
import 'package:vocardo/feature/edit/edit.dart';
import 'package:vocardo/feature/import/import.dart';
import 'package:vocardo/feature/practice/practice.dart';
import 'package:vocardo/feature/study_set/edit_study_set.dart';

class CardListPage extends ConsumerStatefulWidget {
  const CardListPage({super.key});
  @override
  ConsumerState<CardListPage> createState() => _CardListPageState();
}

class _CardListPageState extends ConsumerState<CardListPage> {
  @override
  Widget build(BuildContext context) {
    final cardsRef = ref.watch(cardListProvider);
    final noCard =
        cardsRef.valueOrNull == null || cardsRef.valueOrNull!.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            final cardsRef = ref.watch(cardListProvider);
            const noCards = Text("No cards yet!");
            return cardsRef.when(
                data: (cards) => cards.isNotEmpty
                    ? Text("${cards.length} ${cardOrCards(cards.length)}")
                    : noCards,
                error: (_, __) => noCards,
                loading: () => const CircularProgressIndicator());
          },
        ),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: "edit",
                  child: const Text("Edit"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EditStudySet()));
                  },
                ),
                PopupMenuItem(
                  value: "import",
                  child: const Text("Import CSV"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ImportPage()));
                  },
                ),
              ];
            },
          )
        ],
      ),
      body: cardsRef.when(
        data: (cards) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final card = cards[index];
              return InkWell(
                onTap: () {
                  final studySet = ref.read(currentStudySetProvider);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditPage(
                          studySet: studySet, initialItem: cards[index])));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 8,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Theme.of(context).colorScheme.shadow,
                                )
                              ]),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                      card.question,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        ref
                                            .read(currentTtsProvider.notifier)
                                            .speakQuestion(card.question);
                                      },
                                      icon: const Icon(Icons.volume_up),
                                    ),
                                  ],
                                ),
                                subtitle: Text(cards[index].answer),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                      (card.reviewAfter != null
                                          ? "Review in ${whenIsIt(card.reviewAfter!)}"
                                          : ""),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () async {
                                      final yes = await showOkCancelDialog(
                                          context,
                                          title: "Delete",
                                          content: "Are you sure?");
                                      if (!yes) return;

                                      await ref
                                          .read(cardListProvider.notifier)
                                          .deleteCard(cards[index]);
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: cards.length,
          );
        },
        error: (_, __) {
          return const Text("Error");
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: "add",
                onPressed: () {
                  final set = ref.read(currentStudySetProvider);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditPage(studySet: set)));
                },
                tooltip: 'Add a new word',
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 16),
              FloatingActionButton(
                heroTag: "practice",
                onPressed: noCard
                    ? null
                    : () {
                        ref.read(practiceCardListProvider.notifier).init();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PracticePage()));
                      },
                disabledElevation: noCard ? 0 : 6,
                foregroundColor: noCard ? Colors.grey : null,
                tooltip: 'Practice',
                child: const Icon(Icons.play_arrow),
              ),
            ]),
      ),
    );
  }
}
