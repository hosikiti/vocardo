import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocardo/core/model/item.dart';
import 'package:vocardo/core/model/study_set.dart';
import 'package:vocardo/core/service/card/card_list_provider.dart';
import 'package:vocardo/core/service/isar/isar_service.dart';

part 'card_service.g.dart';

@Riverpod(keepAlive: true)
Future<CardService> cardService(CardServiceRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  return CardService(isar);
}

class CardService {
  final Isar isar;

  CardService(this.isar);

  List<CardItem> fromModel(List<Item> items) {
    return items.map((item) => CardItem.fromModel(item)).toList();
  }

  Future<List<CardItem>> getAll(int studySetId) async {
    final items = await isar.items
        .filter()
        .studySet((q) => q.idEqualTo(studySetId))
        .findAll();
    return fromModel(items);
  }

  Future<List<CardItem>> getAllForPractice(int studySetId) async {
    final query = isar.items
        .filter()
        .studySet((q) => q.idEqualTo(studySetId))
        .reviewAfterLessThan(DateTime.now())
        .limit(100)
        .build();
    final card = await query.findAll();
    return fromModel(card);
  }

  Future<Item?> getItem(int id) async {
    final item = await isar.items.filter().idEqualTo(id).findFirst();
    return item;
  }

  Future<Item> addCard(
      {required StudySet studySet,
      required String question,
      required String answer,
      List<int>? sound}) async {
    final it = Item()
      ..studySet.value = studySet
      ..soundData = sound
      ..question = question
      ..answer = answer;
    await isar.writeTxn(() async {
      await isar.items.put(it);
      await it.studySet.save();
    });
    return it;
  }

  Future<void> deleteCard(int id) async {
    await isar.writeTxn(() async => await isar.items.delete(id));
  }

  Future<void> updateCard(int id, String question, String answer,
      {List<int>? sound}) async {
    final item = await isar.items.get(id);
    if (item == null) {
      return;
    }
    await isar.writeTxn(() async {
      item.question = question;
      item.answer = answer;
      await isar.items.put(item);
    });
  }

  Future<void> updateSound(int id, List<byte> soundData) async {
    final item = await isar.items.get(id);
    if (item == null) {
      return;
    }
    await isar.writeTxn(() async {
      item.soundData = soundData;
      await isar.items.put(item);
    });
  }

  Future<void> updateCardRepetition(
    int id, {
    required int repetition,
    required double easinessFactor,
    required int interval,
    required int quality,
    required DateTime reviewAfter,
    required DateTime lastReviewed,
  }) async {
    final item = await isar.items.get(id);
    if (item == null) {
      return;
    }
    await isar.writeTxn(() async {
      item.repetition = repetition;
      item.interval = interval;
      item.easinessFactor = easinessFactor;
      item.quality = quality;
      item.reviewAfter = reviewAfter;
      item.lastReviewed = lastReviewed;
      await isar.items.put(item);
    });
  }

  Future<void> resetAllCardStats() async {
    final items = await isar.items.where().findAll();

    for (final item in items) {
      await isar.writeTxn(() async {
        item.repetition = null;
        item.easinessFactor = 2.5;
        item.quality = null;
        item.interval = null;
        item.reviewAfter = null;
        item.lastReviewed = null;
        await isar.items.put(item);
      });
    }
  }

  Future<List<int>?> getSound(int id) async {
    final item = await isar.items.get(id);
    return item?.soundData;
  }
}
