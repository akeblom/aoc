import 'package:test/test.dart';

import '../bin/two/two.dart';

void main() {
  test('part 1', () {
    const input = '''A Y
B X
C Z''';
    final result = twoPartOne(input);
    expect(result, "15");
  });

  test('part 2', () {
    const input = '''A Y
B X
C Z''';
    final result = twoPartTwo(input);
    expect(result, "12");
  });
}
