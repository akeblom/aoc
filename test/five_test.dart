import 'package:test/test.dart';

import '../bin/five/five.dart';

const input = '''    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2''';

void main() {
  test('part 1', () {
    final result = fivePartOne(input);
    expect(result, "CMZ");
  });

  test('part 2', () {
    final result = fivePartTwo(input);
    expect(result, "MCD");
  });
}
