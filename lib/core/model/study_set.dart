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

  int getNeedsReviewCount() {
    final needsReviewCount = items.where((e) {
      final nextReview = e.reviewAfter;
      if (nextReview == null) {
        // if there is no next review, it means the card is new
        return true;
      }
      return DateTime.now().isAfter(nextReview);
    }).length;
    return needsReviewCount;
  }
}
