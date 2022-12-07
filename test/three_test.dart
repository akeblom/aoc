import 'package:test/test.dart';

import '../bin/three/three.dart';

const input = '''vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw''';

void main() {
  test('part 1', () {
    final result = threePartOne(input);
    expect(result, "157");
  });

  test('part 2', () {
    final result = threePartTwo(input);
    expect(result, "70");
  });
}
