import 'dart:ffi';
import 'dart:typed_data';

import 'package:isar/isar.dart';

part "item.g.dart";

@collection
class Item {
  Id id = Isar.autoIncrement;

  late String question;
  late String answer;
  late List<byte> soundData;
}
