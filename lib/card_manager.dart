import 'package:isar/isar.dart';
import 'package:vocardo/model/item.dart';
import 'package:vocardo/provider.dart';

class CardManager {
  final Isar isar;

  CardManager(this.isar);

  Future<List<CardItem>> getAll() async {
    final items = await isar.items.where().findAll();
    return items.map((item) {
      return CardItem(id: item.id, prompt: item.question, answer: item.answer);
    }).toList();
  }

  Future<Item> addCard(String prompt, String answer) async {
    final it = Item()
      ..question = prompt
      ..answer = answer;
    await isar.writeTxn(() async => await isar.items.put(it));
    return it;
  }

  Future<void> deleteCard(int id) async {
    await isar.writeTxn(() async => await isar.items.delete(id));
  }
}
