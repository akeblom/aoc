import 'dart:io';

import '../get_input.dart';

// alphabet array
const List<String> alphabet = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z',
];

bool containsChar(String char, String str) {
  return str.contains(char);
}

bool containsCharInChunkLines(String char, String a, String b) {
  return containsChar(char, a) && containsChar(char, b);
}

String processLine(String line) {
  int midpoint = line.length ~/ 2;
  final splitted = [line.substring(0, midpoint), line.substring(midpoint)];
  String? itemType;
  for (var char in splitted[0].runes) {
    final character = String.fromCharCode(char);
    if (containsChar(character, splitted[1])) {
      itemType = character;
      break;
    }
  }
  return itemType ?? '';
}

int calcValue(String e) {
  if (e.isUpperCase()) {
    return alphabet.indexOf(e.toLowerCase()) + 1 + alphabet.length;
  } else {
    return alphabet.indexOf(e) + 1;
  }
}

String threePartOne(String input) {
  final int result = input
      .split('\n')
      .map(processLine)
      .map(calcValue)
      .fold<int>(0, (previousValue, element) => previousValue + element);
  return result.toString();
}

String threePartTwo(String input) {
  final List<List<String>> chunks = input.split('\n').fold([[]], (list, x) {
    return list.last.length == 3 ? (list..add([x])) : (list..last.add(x));
  });

  final int result = chunks
      .map((chunk) {
        String? itemtype;
        for (var char in chunk[0].runes) {
          final character = String.fromCharCode(char);
          if (containsCharInChunkLines(character, chunk[1], chunk[2])) {
            itemtype = character;
            break;
          }
        }
        return itemtype ?? '';
      })
      .map(calcValue)
      .fold<int>(0, (previousValue, element) => previousValue + element);
  return result.toString();
}

extension Case on String {
  // isuppercase
  bool isUpperCase() {
    int ascii = codeUnitAt(0);
    return ascii >= 65 && ascii <= 90;
  }

  // islowercase
  bool isLowerCase() {
    int ascii = codeUnitAt(0);
    return ascii >= 97 && ascii <= 122;
  }
}
