import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocardo/core/model/item.dart';
import 'package:vocardo/core/model/study_set.dart';
import 'package:vocardo/core/service/card/card_list_provider.dart';
import 'package:vocardo/core/service/card/card_service.dart';
import 'package:vocardo/core/service/isar/isar_service.dart';
import 'package:vocardo/core/service/study_set/current_study_set_provider.dart';

part 'practice_card_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PracticeCardList extends _$PracticeCardList {
  @override
  Future<List<CardItem>> build() async {
    return pickCards();
  }

  resetEverything() async {
    final isar = await ref.read(isarProvider.future);

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

  Future<List<CardItem>> pickCards() async {
    final cardService = await ref.read(cardServiceProvider.future);
    final set = ref.watch(currentStudySetProvider);
    final isar = await ref.read(isarProvider.future);

    final query = isar.items
        .filter()
        .studySet((q) => q.idEqualTo(set.id))
        .reviewAfterLessThan(DateTime.now())
        .limit(100)
        .build();
    final card = await query.findAll();

    // pick 10 random cards
    card.shuffle();
    final picked = card.take(10).toList();
    return cardService.fromModel(picked);
  }

  updateCard(int id) async {
    state = const AsyncLoading();
    final isar = await ref.read(isarProvider.future);
    final card = await isar.items.get(id);
    if (card == null) {
      return;
    }
    state = await AsyncValue.guard(() async {
      if (state.valueOrNull == null) {
        return [];
      }
      return state.valueOrNull!
          .map((e) => e.id == id ? CardItem.fromModel(card) : e)
          .toList();
    });
  }

  init() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return pickCards();
    });
  }
}
