import 'dart:async';

import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocardo/core/model/item.dart';
import 'package:vocardo/core/model/study_set.dart';
import 'package:vocardo/core/service/isar/isar_service.dart';

part 'study_set_list_provider.g.dart';

@riverpod
class StudySetList extends _$StudySetList {
  // @override
  // Future<Stream<List<StudySet>>> build() async {
  //   final db = await ref.read(isarProvider.future);
  //   // return db.studySets.where().findAll();
  //   return db.studySets.watchLazy(fireImmediately: true);
  //   // return db.studySets.where().findAll().then(
  //   //   (sets) async {
  //   //     for (final set in sets) {
  //   //       await set.items.load();
  //   //     }
  //   //     return sets;
  //   //   },
  //   // );
  // }
  @override
  Stream<List<StudySet>> build() async* {
    final db = await ref.read(isarProvider.future);
    await for (final _ in db.items.watchLazy(fireImmediately: true)) {
      final result = await db.studySets.where().findAll();
      yield result;
    }
  }

  Future<void> addStudySet(StudySet set) async {
    state = const AsyncLoading();
    final db = await ref.read(isarProvider.future);
    await db.writeTxn(() async {
      db.studySets.put(set);
    });
    ref.invalidateSelf();
  }

  Future<void> deleteStudySet(int id) async {
    state = const AsyncLoading();
    final db = await ref.read(isarProvider.future);
    await db.writeTxn(() async {
      db.studySets.delete(id);
      // remove all cards in this set
      db.items.filter().studySet((q) => q.idEqualTo(id)).deleteAll();
    });
    ref.invalidateSelf();
  }
}
