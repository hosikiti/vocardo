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

  Future<List<CardItem>> pickCards() async {
    final cardService = await ref.read(cardServiceProvider.future);
    final set = ref.watch(currentStudySetProvider);

    final isar = await ref.read(isarProvider.future);
    final query = isar.items
        .filter()
        .studySet((q) => q.idEqualTo(set.id))
        .qualityLessThan(4)
        .reviewAfterLessThan(DateTime.now())
        .build();
    final card = await query.findAll();

    // pick 10 random cards
    final random = card.toList()..shuffle();
    final picked = random.take(10).toList();
    return cardService.fromModel(picked);
  }

  init() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return pickCards();
    });
  }
}
