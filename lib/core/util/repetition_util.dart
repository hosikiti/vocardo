({int repeatCount, int nextIntervalDay, double lastEasinessFactor})
    calculateRepetationInterval({
  required int repeatCount,
  required int quality,
  double? lastEasinessFactor,
  int? lastIntervalDays,
}) {
  double easinessFactor = lastEasinessFactor ?? 2.5;

  if (quality < 3) {
    return (
      repeatCount: 0,
      nextIntervalDay: 1,
      lastEasinessFactor: easinessFactor
    );
  }

  if (repeatCount == 1) {
    return (
      repeatCount: repeatCount,
      nextIntervalDay: 1,
      lastEasinessFactor: easinessFactor
    );
  } else if (repeatCount == 2) {
    return (
      repeatCount: repeatCount,
      nextIntervalDay: 6,
      lastEasinessFactor: easinessFactor
    );
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

  return (
    repeatCount: repeatCount,
    nextIntervalDay: newIntervalDays,
    lastEasinessFactor: newEF
  );
}
