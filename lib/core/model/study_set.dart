import 'package:isar/isar.dart';
import 'package:vocardo/core/model/item.dart';

part "study_set.g.dart";

@collection
class StudySet {
  Id id = Isar.autoIncrement;

  late String name;

  String questionLanguage = "";
  String questionVoiceName = "";
  String questionVoiceLocale = "";
  String answerLanguage = "";
  String answerVoiceName = "";
  String answerVoiceLocale = "";

  @Backlink(to: 'studySet')
  final items = IsarLinks<Item>();
}
