import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

class CardItem {
  CardItem({required this.prompt, required this.answer});

  final String prompt;
  final String answer;
  final String id = UniqueKey().toString();
}

@riverpod
class CurrentCard extends _$CurrentCard {
  @override
  Future<CardItem?> build() async {
    final cards = ref.watch(cardListProvider);

    if (cards.valueOrNull == null) {
      return null;
    }
    return Future.value(cards.valueOrNull!.elementAt(0));
  }

  next() async {
    final cardsRef = ref.read(cardListProvider);
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
}

@riverpod
class CardList extends _$CardList {
  @override
  Future<List<CardItem>> build() async {
    return Future.value([
      CardItem(prompt: "quando", answer: "when"),
      CardItem(prompt: "Bon dia!", answer: "Good morning!"),
      CardItem(prompt: "Ate ja!", answer: "See you later!"),
    ]);
  }

  // Add methods to mutate the state
  addCard(String prompt, String answer) async {
    final item = CardItem(prompt: prompt, answer: answer);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (state.valueOrNull == null) {
        return [];
      }
      return [...state.valueOrNull!, item];
    });
  }

  delete(CardItem card) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      if (state.valueOrNull == null) {
        return [];
      }
      return state.valueOrNull!.where((item) => item != card).toList();
    });
  }
}
