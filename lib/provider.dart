import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocardo/card_manager.dart';
import 'package:vocardo/model/item.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isar(IsarRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open(
    [ItemSchema],
    directory: dir.path,
  );
}

@riverpod
Future<CardManager> cardManager(CardManagerRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  return CardManager(isar);
}

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
  final hoge = 0;

  @override
  Future<List<CardItem>> build() async {
    final man = await ref.read(cardManagerProvider.future);

    return man.getAll();
  }

  add(String prompt, String answer) async {
    final man = await ref.read(cardManagerProvider.future);
    await man.addCard(prompt, answer);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return man.getAll();
    });
  }

  Future<void> delete(CardItem card) async {
    final man = await ref.read(cardManagerProvider.future);
    man.deleteCard(card.id);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return state.valueOrNull!.where((item) => item != card).toList();
    });
  }
}
