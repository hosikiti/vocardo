class RepetitionStats {
  final int repeatCount;
  final int nextIntervalDays;
  final double lastEasinessFactor;

  RepetitionStats({
    required this.repeatCount,
    required this.lastEasinessFactor,
    required this.nextIntervalDays,
  });

  @override
  toString() {
    return 'RepetitionStats(repeatCount: $repeatCount, lastEasinessFactor: $lastEasinessFactor, nextIntervalDays: $nextIntervalDays)';
  }
}

RepetitionStats calculateRepetationInterval({
  required int repeatCount,
  required int quality,
  double? lastEasinessFactor,
  int? lastIntervalDays,
}) {
  var easinessFactor = lastEasinessFactor ?? 2.5;

  if (quality < 3) {
    return RepetitionStats(
        repeatCount: 0,
        lastEasinessFactor: easinessFactor,
        nextIntervalDays: 1);
  }

  if (repeatCount == 1) {
    return RepetitionStats(
        repeatCount: repeatCount,
        lastEasinessFactor: easinessFactor,
        nextIntervalDays: 1);
  } else if (repeatCount == 2) {
    return RepetitionStats(
        repeatCount: repeatCount,
        lastEasinessFactor: easinessFactor,
        nextIntervalDays: 6);
  }

  if (lastIntervalDays == null) {
    throw ArgumentError.notNull('lastIntervalDays');
  }

  var newEF =
      easinessFactor + (0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02));
  if (newEF < 1.3) {
    newEF = 1.3;
  }
  final newIntervalDays = (lastIntervalDays.toDouble() * newEF).round();

  return RepetitionStats(
      repeatCount: repeatCount,
      lastEasinessFactor: newEF,
      nextIntervalDays: newIntervalDays);
}
