import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              IconButton(
                  iconSize: 64,
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      _isRecording = !_isRecording;
                    });
                  },
                  icon: !_isRecording
                      ? const Icon(Icons.radio_button_checked)
                      : const Icon(Icons.stop)),
              const Text("Tap to start recording"),
            ],
          ),
        ],
      ),
    );
  }
}
