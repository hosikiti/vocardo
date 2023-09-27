import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocardo/core/model/item.dart';
import 'package:vocardo/core/service/card/card_service.dart';

part 'card_list_provider.g.dart';

class CardItem {
  CardItem({required this.id, required this.question, required this.answer});

  final String question;
  final String answer;
  final int id;

  CardItem.fromModel(Item item)
      : id = item.id,
        question = item.question,
        answer = item.answer;
}

@Riverpod(keepAlive: true)
class CardList extends _$CardList {
  @override
  Future<List<CardItem>> build() async {
    final man = await ref.read(cardServiceProvider.future);

    return man.getAll();
  }

  Future<void> add(String prompt, String answer) async {
    final man = await ref.read(cardServiceProvider.future);
    final newItem = await man.addCard(prompt, answer);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return [...state.valueOrNull!, CardItem.fromModel(newItem)];
    });
  }

  Future<void> delete(CardItem card) async {
    final man = await ref.read(cardServiceProvider.future);
    man.deleteCard(card.id);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return state.valueOrNull!.where((item) => item != card).toList();
    });
  }
}
