import 'dart:convert';
import 'dart:math';

final regexp = RegExp(r'(\d+)-(\d+),(\d+)-(\d+)');
typedef FindFunction = Function(List<int>, List<int>);

bool isInRange(List<int> a, List<int> b) {
  return a[0] <= b[0] && a[1] >= b[1];
}

bool overlapping(List<int> a, List<int> b) {
  return a[0] <= b[1] && a[1] >= b[0];
}

bool findPairs(String str, FindFunction func) {
  final matches = regexp.firstMatch(str);
  final int a = int.parse(matches!.group(1)!);
  final int b = int.parse(matches.group(2)!);
  final int c = int.parse(matches.group(3)!);
  final int d = int.parse(matches.group(4)!);
  final isMatching = func([a, b], [c, d]) || func([c, d], [a, b]);
  return isMatching;
}

String fourPartOne(String input) {
  final pairs = LineSplitter.split(input)
      .map((e) => e.trim())
      .map((e) => findPairs(e, isInRange))
      .where(
        (element) => element,
      )
      .length;

  return pairs.toString();
}

String fourPartTwo(String input) {
  final pairs = LineSplitter.split(input)
      .map((e) => e.trim())
      .map((e) => findPairs(e, overlapping))
      .where(
        (element) => element,
      )
      .length;

  return pairs.toString();
}
