import 'package:test/test.dart';
import 'package:vocardo/core/util/text_util.dart';

void main() {
  test('cardOrCards', () {
    expect(cardOrCards(0), "cards");
    expect(cardOrCards(1), "card");
    expect(cardOrCards(2), "cards");
  });
}
