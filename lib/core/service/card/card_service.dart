import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vocardo/core/model/item.dart';
import 'package:vocardo/core/service/card/card_list_provider.dart';
import 'package:vocardo/core/service/isar/isar_service.dart';

part 'card_service.g.dart';

@Riverpod(keepAlive: true)
Future<CardService> cardService(CardServiceRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  return CardService(isar);
}

class CardService {
  final Isar isar;

  CardService(this.isar);

  Future<List<CardItem>> getAll() async {
    final items = await isar.items.where().findAll();
    return items.map((item) => CardItem.fromModel(item)).toList();
  }

  Future<Item> addCard(
      {required String question,
      required String answer,
      List<int>? sound}) async {
    final it = Item()
      ..soundData = sound
      ..question = question
      ..answer = answer;
    await isar.writeTxn(() async => await isar.items.put(it));
    return it;
  }

  Future<void> deleteCard(int id) async {
    await isar.writeTxn(() async => await isar.items.delete(id));
  }

  Future<void> updateCard(int id, String question, String answer,
      {List<int>? sound}) async {
    final item = await isar.items.get(id);
    if (item == null) {
      return;
    }
    await isar.writeTxn(() async {
      item.question = question;
      item.answer = answer;
      await isar.items.put(item);
    });
  }

  Future<void> updateSound(int id, List<byte> soundData) async {
    final item = await isar.items.get(id);
    if (item == null) {
      return;
    }
    await isar.writeTxn(() async {
      item.soundData = soundData;
      await isar.items.put(item);
    });
  }

  Future<List<int>?> getSound(int id) async {
    final item = await isar.items.get(id);
    return item?.soundData;
  }
}
