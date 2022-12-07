enum Move {
  rock(1),
  paper(2),
  scissors(3);

  const Move(this.points);
  final int points;
}

enum Outcome {
  win,
  lose,
  draw,
}

const int win = 6;

int score({required Move m, required Move o}) {
  int points = 0;
  if (m.points == o.points) {
    points = m.points + 3;
  } else {
    switch (m) {
      case Move.rock:
        if (o == Move.scissors) {
          points = 6 + m.points;
        } else {
          points = m.points;
        }
        break;
      case Move.paper:
        if (o == Move.rock) {
          points = 6 + m.points;
        } else {
          points = m.points;
        }
        break;
      case Move.scissors:
        if (o == Move.paper) {
          points = 6 + m.points;
        } else {
          points = m.points;
        }
        break;
    }
  }
  return points;
}

String twoPartOne(String input) {
  //final input = getFileInput('two');
  final totalScore = input.split('\n').map((e) {
    final split = e.split(' ');
    return score(
      o: split[0].parseMove(),
      m: split[1].parseMove(),
    );
  }).reduce((value, element) => value + element);

  return totalScore.toString();
}

String twoPartTwo(String input) {
  final totalScore = input.split('\n').map((e) {
    final split = e.split(' ');
    final o = split[0].parseMove();
    final outcome = split[1].parseOutcome();
    late Move myMove;

    if (outcome == Outcome.draw) {
      return score(m: o, o: o);
    }

    switch (o) {
      case Move.rock:
        myMove = outcome == Outcome.win ? Move.paper : Move.scissors;
        break;
      case Move.paper:
        myMove = outcome == Outcome.win ? Move.scissors : Move.rock;
        break;
      case Move.scissors:
        myMove = outcome == Outcome.win ? Move.rock : Move.paper;
        break;
    }

    return score(m: myMove, o: o);
  }).reduce((value, element) => (value) + (element));

  return totalScore.toString();
}

extension on String {
  Outcome parseOutcome() {
    if (this == 'Z') {
      return Outcome.win;
    } else if (this == 'X') {
      return Outcome.lose;
    } else if (this == 'Y') {
      return Outcome.draw;
    } else {
      throw Exception('Invalid input');
    }
  }

  Move parseMove() {
    if (this == 'A' || this == 'X') {
      return Move.rock;
    } else if (this == 'B' || this == 'Y') {
      return Move.paper;
    } else if (this == 'C' || this == 'Z') {
      return Move.scissors;
    } else {
      throw Exception('Invalid input');
    }
  }
}
