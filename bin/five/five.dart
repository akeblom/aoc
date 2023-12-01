import 'dart:convert';
import 'dart:math';

var re = RegExp(r"\w+|\s+|[^\s\w]+");

class Move {
  final int count;
  final int from;
  final int to;

  Move({required this.count, required this.from, required this.to});
}

// function that takes a string and splits it into chunks of four characters
// and returns a list of those chunks
Iterable<String> splitIntoChunks(String str) sync* {
  for (var i = 0; i < str.length; i += 4) {
    yield str.substring(i, min(i + 4, str.length));
  }
}

List<List<String>> transformStacks(Iterable<String> stacks) {
  final foo = stacks.map((e) => e.split(',')).toList();

  final chunks = foo.sublist(0, foo.length - 1).map((row) {
    final rowString = row.join('');
    final chunks = splitIntoChunks(rowString);
    return chunks;
  });

  final mapped = List.generate(chunks.first.length, (index) => <String>[]);
  for (int i = 0; i < mapped.length; i++) {
    for (final chunk in chunks) {
      final trimmed = chunk.elementAt(i).trim();
      if (trimmed.isNotEmpty) {
        mapped[i].add(chunk.elementAt(i));
      }
    }
  }
  return mapped;
}

List<List<String>> makeSingleMove(Move move, List<List<String>> stacks) {
  final fromIndex = move.from - 1;
  final toIndex = move.to - 1;
  final copy = List<List<String>>.from(stacks).toList();
  final from = copy[move.from - 1];
  final to = copy[move.to - 1];

  for (int i = 0; i < move.count; i++) {
    final item = from.removeAt(0);
    to.insert(0, item);
  }

  copy[fromIndex] = from;
  copy[toIndex] = to;
  return copy;
}

List<List<String>> makeMultiMove(Move move, List<List<String>> stacks) {
  final fromIndex = move.from - 1;
  final toIndex = move.to - 1;
  final copy = List<List<String>>.from(stacks).toList();
  final from = copy[move.from - 1];
  final to = copy[move.to - 1];

  final movedItems = from.sublist(0, move.count);
  from.removeRange(0, move.count);

  to.insertAll(0, movedItems);

  copy[fromIndex] = from;
  copy[toIndex] = to;
  return copy;
}

String fivePartOne(String input) {
  final base = input.split('\n\n');
  final stacks = LineSplitter.split(base[0]);
  final moves = LineSplitter.split(base[1]);
  final stackObjects = transformStacks(stacks);

  final moveList = moves.map((e) => e.nextMove()).toList();

  List<List<String>> movedStacks = stackObjects;

  for (var element in moveList) {
    movedStacks = makeSingleMove(element, stackObjects);
  }

  return movedStacks
      .map((e) => e.first.isEmpty ? '' : e.first.substring(1, 2))
      .join('');
}

String? fivePartTwo(String input) {
  final base = input.split('\n\n');
  final stacks = LineSplitter.split(base[0]);
  final moves = LineSplitter.split(base[1]);
  final stackObjects = transformStacks(stacks);

  final moveList = moves.map((e) => e.nextMove()).toList();

  List<List<String>> movedStacks = stackObjects;

  for (var element in moveList) {
    movedStacks = makeMultiMove(element, stackObjects);
  }

  return movedStacks
      .map((e) => e.first.isEmpty ? '' : e.first.substring(1, 2))
      .join('');
}

extension on String {
  //move 1 from 2 to 1
  Move nextMove() {
    final re = RegExp(r'move (\d+) from (\d+) to (\d+)');
    final matches = re.firstMatch(this);

    final count = int.parse(matches?.group(1) ?? '');
    final from = int.parse(matches?.group(2) ?? '');
    final to = int.parse(matches?.group(3) ?? '');
    return Move(count: count, from: from, to: to);
  }
}
