import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

class CardItem {
  const CardItem({required this.prompt, required this.answer});

  final String prompt;
  final String answer;
}

@riverpod
class CardList extends _$CardList {
  @override
  List<CardItem> build() {
    return [
      const CardItem(prompt: "quando", answer: "when"),
    ];
  }

  // Add methods to mutate the state
  addCard() {
    state.add(const CardItem(prompt: "cansado", answer: "tired"));
    state = state.sublist(0);
  }

  delete(CardItem card) {
    state.remove(card);
    state = state.sublist(0);
  }
}
