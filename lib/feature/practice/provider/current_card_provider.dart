import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocardo/feature/card_list/card_list_provider.dart';
import 'package:vocardo/feature/practice/practice_card_list_provider.dart';

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

  next() async {
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
