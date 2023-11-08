import 'package:isar/isar.dart';

part "config.g.dart";

@collection
class Config {
  Id id = Isar.autoIncrement;

  late bool showAnswerRandomly;
}

final defaultConfig = Config()..showAnswerRandomly = false;
