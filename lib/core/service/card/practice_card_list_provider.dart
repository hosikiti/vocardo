import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocardo/core/service/card/card_list_provider.dart';
import 'package:vocardo/core/service/card/card_service.dart';
import 'package:vocardo/core/service/study_set/current_study_set_provider.dart';

part 'practice_card_list_provider.g.dart';

class PracticeCardListImpl {
  PracticeCardListImpl();
}

@Riverpod(keepAlive: false)
class PracticeCardList extends _$PracticeCardList {
  @override
  Future<List<CardItem>> build() async {
    return _pickCards();
  }

  Future<List<CardItem>> _pickCards() async {
    final cardService = await ref.read(cardServiceProvider.future);
    final set = ref.read(currentStudySetProvider);
    final cards = await cardService.getAllForPractice(set.id);
    // pick 10 random cards
    cards.shuffle();
    return cards.take(10).toList();
  }

  resetEverything() async {
    final cardService = await ref.read(cardServiceProvider.future);
    await cardService.resetAllCardStats();
  }

  updateCard(int id) async {
    state = const AsyncLoading();

    final cardService = await ref.read(cardServiceProvider.future);
    final card = await cardService.getItem(id);

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
}
