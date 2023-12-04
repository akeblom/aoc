import '../../aoc.dart';
import '../01/one.dart';

class Num {
  final int value;
  final int row;
  final List<int> indexes;
  final Symbol symbol;
  Num(
      {required this.value,
      required this.row,
      required this.indexes,
      required this.symbol});
}

class Symbol {
  final String value;
  final int row;
  final int index;
  Symbol(this.value, this.row, this.index);

  @override
  bool operator ==(Object other) =>
      other is Symbol &&
      other.runtimeType == runtimeType &&
      other.row == row &&
      other.index == index &&
      other.value == value;

  @override
  int get hashCode => value.hashCode * row.hashCode * index.hashCode;
}

(int, int) run(String input, {bool part2 = false}) {
  List<Num> numbers = [];

  final rows = input.splitInputToLine();
  bool numberInProgress = false;
  String number = '';
  List<int> indexes = [];

  void reset() {
    numberInProgress = false;
    number = '';
    indexes = [];
  }

  void addNumber(String numberToAdd, int row, int rowLength) {
    int startIndex = indexes.first;
    int endIndex = indexes.last;
    int extendedStartIndex = (startIndex - 1).clamp(0, startIndex);
    int extendedEndIndex = (endIndex + 1).clamp(endIndex, rowLength);
    int extendedRowStartIndex = (row - 1).clamp(0, row);
    int extendedRowEndIndex = (row + 1).clamp(row, rows.length - 1);

    Symbol? possibleSymbol;
    for (int i = 0; i <= extendedRowEndIndex; i++) {
      final row = rows[i];
      for (int j = 0; j < row.length; j++) {
        if (i >= extendedRowStartIndex &&
            j >= extendedStartIndex &&
            j <= extendedEndIndex) {
          final char = row[j];
          if (char.isSymbol()) {
            possibleSymbol = Symbol(char, i, j);
          }
        }
      }
    }
    if (possibleSymbol == null || possibleSymbol.value != '*') {
      return;
    }
    numbers.add(Num(
        symbol: possibleSymbol,
        indexes: indexes,
        row: row,
        value: int.parse(numberToAdd)));
    reset();
  }

  for (int i = 0; i < rows.length; i++) {
    final row = rows[i];
    for (int j = 0; j < row.length; j++) {
      final char = row[j];

      if (char.isDigit()) {
        numberInProgress = true;
        number += char;
        indexes.add(j);
      } else {
        if (numberInProgress) {
          addNumber(number, i, row.length - 1);
        }
        reset();
      }
      if (j == row.length - 1 && numberInProgress) {
        addNumber(number, i, row.length - 1);
      }
    }
  }
  // List<int> valuesToSum = [];
  Set<Symbol> symbols = {};
  List<int> gearRatios = [];
  for (final number in numbers) {
    final symbol = number.symbol;
    symbols.add(symbol);
  }

  for (var el in symbols) {
    final pairs = numbers.where((element) => element.symbol == el).toList();
    if (pairs.length == 2) {
      gearRatios.add(pairs[0].value * pairs[1].value);
    }
  }

  final gearSum = gearRatios.fold(0, (p, e) => p + e);
  // // final partSum = valuesToSum.fold(0, (p, e) => p + e);

  return (0, gearSum);
}
