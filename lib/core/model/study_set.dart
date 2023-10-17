import 'package:isar/isar.dart';
import 'package:vocardo/core/model/item.dart';

part "study_set.g.dart";

@collection
class StudySet {
  Id id = Isar.autoIncrement;

  late String name;

  @Backlink(to: 'studySet')
  final items = IsarLinks<Item>();
}
