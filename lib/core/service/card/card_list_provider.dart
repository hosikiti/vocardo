import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocardo/core/model/item.dart';
import 'package:vocardo/core/model/study_set.dart';
import 'package:vocardo/core/service/card/card_service.dart';
import 'package:vocardo/core/service/isar/isar_service.dart';
import 'package:vocardo/core/service/study_set/current_study_set_provider.dart';

part 'card_list_provider.g.dart';

class CardItem {
  CardItem({
    required this.id,
    required this.question,
    required this.answer,
    this.reviewAfter,
  });

  final String question;
  final String answer;
  final int id;
  DateTime? reviewAfter;

  CardItem.fromModel(Item item)
      : id = item.id,
        question = item.question,
        answer = item.answer,
        reviewAfter = item.reviewAfter;
}

@Riverpod(keepAlive: true)
class CardList extends _$CardList {
  @override
  Stream<List<CardItem>> build() async* {
    final cardService = await ref.read(cardServiceProvider.future);
    final set = ref.watch(currentStudySetProvider);
    final db = await ref.read(isarProvider.future);
    final query =
        db.items.filter().studySet((q) => q.idEqualTo(set.id)).build();
    await for (final _ in query.watchLazy(fireImmediately: true)) {
      yield await cardService.getAll(set.id);
    }
  }

  Future<void> deleteCard(CardItem card) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final cardService = await ref.read(cardServiceProvider.future);
      cardService.deleteCard(card.id);
      return state.valueOrNull!.where((item) => item != card).toList();
    });
  }

  Future<void> updateCard(CardItem card) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final cardService = await ref.read(cardServiceProvider.future);
      await cardService.updateCard(card.id, card.question, card.answer);
      return state.valueOrNull!.map((item) {
        if (item.id == card.id) {
          return card;
        }
        return item;
      }).toList();
    });
  }
}
