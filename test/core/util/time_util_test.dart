import 'package:test/test.dart';
import 'package:vocardo/core/util/time_util.dart';

void main() {
  test('whenIsIt', () {
    expect(whenIsIt(DateTime.now().add(const Duration(hours: 25))), "1 days");
    expect(whenIsIt(DateTime.now().add(const Duration(hours: 2))), "1 hrs.");
    expect(whenIsIt(DateTime.now().add(const Duration(minutes: 2))), "1 min.");
    expect(whenIsIt(DateTime.now().add(const Duration(seconds: 10))), "9 sec.");
    expect(whenIsIt(DateTime.now()), "Now");
    expect(whenIsIt(DateTime.now().subtract(const Duration(days: 1))), "Now");
  });
}
