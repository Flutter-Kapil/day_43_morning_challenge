import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test('Test Case 1', () {
    expect(verifyCard(49927398716), true);
    expect(verifyCard(2581), false);
  });
}
