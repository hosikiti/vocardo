import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ElapsedTime extends ConsumerWidget {
  final int elapsedInSec;

  const ElapsedTime({Key? key, required this.elapsedInSec}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (elapsedInSec >= 60 * 60) {
      return const Text("--:--");
    }

    final min = (elapsedInSec ~/ 60).toString().padLeft(2, '0');
    final sec = (elapsedInSec % 60).toString().padLeft(2, '0');
    return Text("$min:$sec");
  }
}
