import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vocardo/core/service/card/card_service.dart';
import 'package:vocardo/feature/practice/provider/current_card_provider.dart';
import 'package:vocardo/core/service/recorder/recorder_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:vocardo/core/widget/elapsed_time_widget.dart';

Future<void> showRecordingDialog(BuildContext context) async {
  await showModalBottomSheet(
    isDismissible: false,
    enableDrag: false,
    context: context,
    builder: (context) {
      return const RecorderPanel();
    },
  );
}

class RecorderPanel extends ConsumerStatefulWidget {
  const RecorderPanel({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecorderPanelState();
}

class _RecorderPanelState extends ConsumerState<RecorderPanel> {
  bool _isRecording = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // close button
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () async {
                    final tmpPath = await getTemporaryDirectory();
                    final filePath = '${tmpPath.path}/myFile.m4a';
                    AudioPlayer audioPlayer = AudioPlayer();
                    await audioPlayer.play(DeviceFileSource(filePath));
                  },
                  child: const Text("xxxx")),
              IconButton(
                  iconSize: 64,
                  color: Colors.red,
                  onPressed: () async {
                    final recorder = await ref.read(recorderProvider.future);
                    final ellapsed =
                        ref.read(recordElapsedTimeProvider.notifier);
                    final recording = !_isRecording;
                    if (recording) {
                      // start recording
                      await recorder.startRec();
                      ellapsed.start();
                    } else {
                      ellapsed.stop();
                      final data = await recorder.stopRec();
                      AudioPlayer audioPlayer = AudioPlayer();
                      await audioPlayer
                          .play(BytesSource(Uint8List.fromList(data)));

                      final card = ref.read(currentCardProvider).valueOrNull;
                      if (card != null) {
                        final cardService =
                            await ref.read(cardServiceProvider.future);
                        cardService.updateSound(card.id, data);
                      }
                    }

                    setState(() {
                      _isRecording = recording;
                    });
                  },
                  icon: !_isRecording
                      ? const Icon(Icons.mic)
                      : const Icon(Icons.stop_circle)),
              _isRecording
                  ? const SizedBox.shrink()
                  : const Text("Tap to start recording"),
              Consumer(builder: ((context, ref, child) {
                final elapsed = ref.watch(recordElapsedTimeProvider);
                if (!_isRecording) {
                  return const SizedBox.shrink();
                }
                return ElapsedTime(elapsedInSec: elapsed);
              }))
            ],
          ),
        ],
      ),
    );
  }
}
