import '../../aoc.dart';

class LotteryTicket {
  final String name;
  final List<int> myNumbers;
  final List<int> winningNumbers;

  LotteryTicket(this.name, this.myNumbers, this.winningNumbers);

  int get matchingNumbers {
    return myNumbers
        .where((element) => winningNumbers.contains(element))
        .length;
  }

  int get points {
    int points = 1;
    if (matchingNumbers == 0) {
      return 0;
    }
    for (int i = 0; i < matchingNumbers - 1; i++) {
      points *= 2;
    }

    return points;
  }
}

(int, int) run(String input, {bool part2 = false}) {
  final rows = input.splitInputToLine();

  LotteryTicket extractedTickets(String e) {
    final nameSplit = e.split(":");
    final name = nameSplit[0];

    final numbersSplit = nameSplit[1].split("|");
    final List<int> winningNumbers = numbersSplit[0]
        .trim()
        .split(RegExp(r"\s+"))
        .map((e) => int.parse(e))
        .toList();
    final List<int> myNumbers = numbersSplit[1]
        .trim()
        .split(RegExp(r"\s+"))
        .map((e) => int.parse(e))
        .toList();

    return LotteryTicket(name, myNumbers, winningNumbers);
  }

  List<LotteryTicket> wins = [];
  // part1
  int result = rows
      .map(extractedTickets)
      .map((e) => e.points)
      .fold(0, (previousValue, element) => previousValue + element);

  // part2
  final tickets = rows.map(extractedTickets).toList();

  void getNumberOfWins(int startIndex) {
    for (int i = startIndex;
        i < (tickets[startIndex].matchingNumbers + startIndex);
        i++) {
      final ticket = tickets[i];
      wins.add(ticket);
      getNumberOfWins(i + 1);
    }
  }

  for (int i = 0; i < tickets.length; i++) {
    getNumberOfWins(i);
  }

  return (result, wins.length + tickets.length);
}
// 2808890. 3124432