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
class CardList extends _$CardList {
  @override
  Future<List<CardItem>> build() async {
    return Future.value([
      CardItem(prompt: "quando", answer: "when"),
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
