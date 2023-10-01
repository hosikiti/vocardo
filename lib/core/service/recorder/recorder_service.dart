import 'dart:convert';
import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:record/record.dart';
part 'recorder_service.g.dart';

@Riverpod(keepAlive: true)
class RecordElapsedTime extends _$RecordElapsedTime {
  bool _recording = false;

  @override
  int build() {
    return 0;
  }

  start() {
    state = 0;
    _recording = true;
    _incrementSecond();
  }

  stop() {
    state = 0;
    _recording = false;
  }

  _incrementSecond() {
    Future.delayed(const Duration(seconds: 1), () {
      state = state + 1;
      if (_recording) {
        _incrementSecond();
      }
    });
  }
}

class Recorder {
  final _record = Record();
  String _filePath = '';

  startRec() async {
    if (await _record.hasPermission()) {
      final tmpPath = await getTemporaryDirectory();
      _filePath = '${tmpPath.path}/myFile.m4a';
      await _record.start(
        path: _filePath,
        encoder: AudioEncoder.aacLc, // by default
        bitRate: 32000, // by default
        samplingRate: 44100, // by default
      );
    }
  }

  Future<List<byte>> stopRec() async {
    await _record.stop();
    File file = File(_filePath);
    final bytes = await file.readAsBytes();
    return bytes;
  }
}

@Riverpod(keepAlive: true)
Future<Recorder> recorder(RecorderRef ref) async {
  return Recorder();
}
