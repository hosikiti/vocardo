import 'package:isar/isar.dart';
import 'package:vocardo/core/model/study_set.dart';

part "item.g.dart";

@collection
class Item {
  Id id = Isar.autoIncrement;
  final studySet = IsarLink<StudySet>();

  late String question;
  late String answer;
  int? repetition;
  int? interval;
  int? lastInterval;
  DateTime? reviewAfter;
  double? easinessFactor;
  int? quality;
  List<byte>? soundData;
}
