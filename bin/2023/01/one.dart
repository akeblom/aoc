RegExp reOne = RegExp(r'(\d)');
RegExp reTwo = RegExp(r'(?=(\d|one|two|three|four|five|six|seven|eight|nine))');

extension on String {
  List<int> allOccurancesIndex(String pattern) {
    List<int> indexes = [];
    var startIndex = 0;
    bool goOn = true;
    while (goOn) {
      final index = indexOf(pattern, startIndex);
      if (index == -1) {
        goOn = false;
      } else {
        indexes.add(index);
        startIndex = index + 1;
      }
    }
    return indexes;
  }

  String toNumString() {
    return convertToNum(this).toString();
  }
}

int day_1(String input, {bool part2 = false}) {
  final lines = splitInputToLine(input);

  int mapper(String line) {
    final matches = part2 ? reTwo.allMatches(line) : reOne.allMatches(line);
    if (matches.isEmpty) {
      return 0;
    }

    for (final match in matches) {
      print(match.group(1));
    }

    final String? firstMatch = matches.first.group(1)?.toNumString();
    final String? lastMatch = matches.last.group(1)?.toNumString();

    final value = '$firstMatch$lastMatch';
    return int.parse(value);
    // print("$value -> $intValue");
  }

  return lines.map(mapper).fold(0, (p, e) => p + e);
}

List<String> thingToSearchFor = [
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9'
];

int convertToNum(String? str) {
  final result = switch (str) {
    'one' => 1,
    'two' => 2,
    'three' => 3,
    'four' => 4,
    'five' => 5,
    'six' => 6,
    'seven' => 7,
    'eight' => 8,
    'nine' => 9,
    _ => int.parse(str ?? '')
  };
  // print("$str -> $result");
  return result;
}

List<String> splitInputToLine(String input) {
  return input.split('\n');
}
