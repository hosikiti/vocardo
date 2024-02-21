import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocardo/core/service/card/card_service.dart';
import 'package:vocardo/core/util/repetition_util.dart';
import 'package:vocardo/feature/card_list/provider/card_list_provider.dart';
import 'package:vocardo/feature/practice/provider/practice_card_list_provider.dart';

part 'current_card_provider.g.dart';

@Riverpod(keepAlive: false)
class CurrentCard extends _$CurrentCard {
  @override
  Future<CardItem?> build() async {
    final cards = ref.watch(practiceCardListProvider);

    if (cards.valueOrNull == null || cards.valueOrNull!.isEmpty) {
      return null;
    }
    return Future.value(cards.valueOrNull!.elementAt(0));
  }

  Future<void> next() async {
    final cardsRef = ref.read(practiceCardListProvider);
    if (state.valueOrNull == null || cardsRef.valueOrNull == null) {
      return;
    }
    final cards = cardsRef.valueOrNull!;
    final card = state.valueOrNull!;
    if (cards.last == card) {
      return;
    }
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return cards.elementAt(cards.indexOf(card) + 1);
    });
  }

  setNewInterval(int quality) async {
    final currentCard = state;
    final card = currentCard.valueOrNull;
    if (card == null) {
      return;
    }

    final cardService = await ref.read(cardServiceProvider.future);
    final item = await cardService.getItem(card.id);
    if (item == null) {
      return;
    }

    final rep = calculateRepetationInterval(
        repeatCount: (item.repetition ?? 0) + 1,
        quality: quality,
        lastEasinessFactor: item.easinessFactor,
        lastIntervalDays: item.interval);

    // This makes reviewing the card 4 times faster.
    DateTime reviewAfter =
        DateTime.now().add(Duration(hours: rep.nextIntervalDay * 6));

    await cardService.updateCardRepetition(
      card.id,
      repetition: rep.repeatCount,
      easinessFactor: rep.lastEasinessFactor,
      interval: rep.nextIntervalDay,
      quality: quality,
      reviewAfter: reviewAfter,
      lastReviewed: DateTime.now(),
    );
  }

  bool isLast() {
    final cardsRef = ref.read(practiceCardListProvider);
    if (state.valueOrNull == null || cardsRef.valueOrNull == null) {
      return false;
    }
    final cards = cardsRef.valueOrNull!;
    final card = state.valueOrNull!;
    return cards.last == card;
  }
}
