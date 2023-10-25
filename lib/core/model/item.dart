import 'package:isar/isar.dart';
import 'package:vocardo/core/model/study_set.dart';

part "item.g.dart";

@collection
class Item {
  Id id = Isar.autoIncrement;
  final studySet = IsarLink<StudySet>();

  late String question;
  late String answer;
  late int? repetition;
  late int? interval;
  late int? lastInterval;
  late DateTime? reviewAfter;
  late double? easinessFactor;
  late int? quality;
  late List<byte>? soundData;
}
