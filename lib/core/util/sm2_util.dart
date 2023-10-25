class SM2Property {
  final int repetition;
  final int interval;
  final int lastInterval;
  final double easinessFactor;
  final int quality;

  SM2Property(
      {required this.repetition,
      required this.interval,
      required this.lastInterval,
      required this.easinessFactor,
      required this.quality});
}

SM2Property sm2({required SM2Property props}) {
  var lastInterval = props.lastInterval;
  if (lastInterval <= 0) {
    lastInterval = 0;
  }
  var lastEF = props.easinessFactor;
  if (lastEF == 0.0 || lastEF.isNaN) {
    lastEF = 2.5;
  }

  var repetition = props.repetition;
  if (repetition <= 0) {
    repetition = 1;
  }

  var newInterval = 0;
  if (props.interval <= 1) {
    newInterval = 1;
  } else if (props.interval == 2) {
    newInterval = 6;
  }
  if (newInterval > 0) {
    return SM2Property(
        repetition: repetition + 1,
        interval: newInterval,
        lastInterval: lastInterval,
        easinessFactor: lastEF,
        quality: props.quality);
  }

  var newEF = lastEF +
      (0.1 - (5 - props.quality) * (0.08 + (5 - props.quality) * 0.02));
  if (newEF < 1.3) {
    newEF = 1.3;
  }
  newInterval = (lastInterval.toDouble() * newEF).round();

  return SM2Property(
      repetition: repetition + 1,
      interval: newInterval,
      lastInterval: lastInterval,
      easinessFactor: newEF,
      quality: props.quality);
}
