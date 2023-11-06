import 'package:test/test.dart';
import 'package:vocardo/core/util/text_util.dart';

void main() {
  test('unitText', () {
    expect(unitText(0, "card", "cards"), "cards");
    expect(unitText(1, "card", "cards"), "card");
    expect(unitText(2, "card", "cards"), "cards");
  });
}
