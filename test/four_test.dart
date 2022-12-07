import 'package:test/test.dart';

import '../bin/four/four.dart';

const input = '''2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8''';

void main() {
  test('part 1', () {
    final result = fourPartOne(input);
    expect(result, "2");
  });

  test('part 2', () {
    final result = fourPartTwo(input);
    expect(result, "4");
  });
}
