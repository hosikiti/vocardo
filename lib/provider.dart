import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocardo/main.dart';
import 'package:vocardo/model/item.dart';

part 'provider.g.dart';

class CardItem {
  CardItem({required this.id, required this.prompt, required this.answer});

  final String prompt;
  final String answer;
  final int id;
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
    final items = await isar.items.where().findAll();

    final cardItems = items.map((item) {
      return CardItem(id: item.id, prompt: item.question, answer: item.answer);
    }).toList();

    return Future.value(cardItems);
  }

  // Add methods to mutate the state
  addCard(String prompt, String answer) async {
    final it = Item()
      ..question = prompt
      ..answer = answer;
    await isar.writeTxn(() async => await isar.items.put(it));

    final item = CardItem(id: it.id, prompt: prompt, answer: answer);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (state.valueOrNull == null) {
        return [];
      }
      return [...state.valueOrNull!, item];
    });
  }

  delete(CardItem card) async {
    await isar.writeTxn(() async => await isar.items.delete(card.id));

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      if (state.valueOrNull == null) {
        return [];
      }
      return state.valueOrNull!.where((item) => item != card).toList();
    });
  }
}
