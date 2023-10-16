import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocardo/core/model/item.dart';
import 'package:vocardo/core/model/study_set.dart';
import 'package:vocardo/core/service/isar/isar_service.dart';

part 'study_set_list_provider.g.dart';

@riverpod
class StudySetList extends _$StudySetList {
  @override
  Future<List<StudySet>> build() async {
    final db = await ref.read(isarProvider.future);
    return db.studySets.where().findAll();
  }

  Future<void> addStudySet(StudySet set) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final db = await ref.read(isarProvider.future);
      await db.writeTxn(() async {
        db.studySets.put(set);
      });

      return [...state.valueOrNull!, set];
    });
  }

  Future<void> deleteStudySet(int id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final db = await ref.read(isarProvider.future);
      await db.writeTxn(() async {
        db.studySets.delete(id);
        // remove all cards in this set
        db.items.filter().studySet((q) => q.idEqualTo(id)).deleteAll();
      });

      return state.valueOrNull!.where((item) => item.id != id).toList();
    });
  }
}
