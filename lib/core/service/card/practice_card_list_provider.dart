import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocardo/core/service/card/card_list_provider.dart';
import 'package:vocardo/core/service/card/card_service.dart';

part 'practice_card_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PracticeCardList extends _$PracticeCardList {
  @override
  Future<List<CardItem>> build() async {
    return pickCards();
  }

  Future<List<CardItem>> pickCards() async {
    final man = await ref.read(cardServiceProvider.future);

    final card = await man.getAll();

    // pick 10 random cards
    final random = card.toList()..shuffle();
    final picked = random.take(10).toList();
    return picked;
  }

  init() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return pickCards();
    });
  }
}
