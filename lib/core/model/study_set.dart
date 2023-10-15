import 'package:isar/isar.dart';

part "study_set.g.dart";

@collection
class StudySet {
  Id id = Isar.autoIncrement;

  late String name;
}
