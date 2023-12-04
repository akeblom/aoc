import 'package:test/test.dart';

import 'problem.dart';

const input = '''467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...\$.*....
.664.598..''';

void main() {
  test('part 2', () {
    final (part1, part2) = run(input);
    //expect(part1, 4361);
    expect(part2, 467835);
  });
}
