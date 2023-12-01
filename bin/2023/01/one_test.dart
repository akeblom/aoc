import 'package:test/test.dart';

import 'one.dart';

const input = '''1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet''';

const input2 = '''two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen''';

void main() {
  // test('part 1', () {
  //   final result = part_1(input);
  //   expect(result, 142);
  // });

  test('part 2', () {
    final result = day_1(input2);
    expect(result, 281);
  });
}
