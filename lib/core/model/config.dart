import 'package:isar/isar.dart';

part "config.g.dart";

@collection
class Config {
  Id id = Isar.autoIncrement;

  late bool showAnswerRandomly;

  Config copyWith({
    bool? showAnswerRandomly,
  }) {
    return Config()
      ..id = id
      ..showAnswerRandomly = showAnswerRandomly ?? this.showAnswerRandomly;
  }
}

final defaultConfig = Config()..showAnswerRandomly = false;
