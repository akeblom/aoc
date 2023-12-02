extension on String {}

int run(String input, {bool part2 = false}) {
  final List<({String gameData, String id})> games =
      splitInputToLine(input).map(gameMapper).toList();

  final allGames = games.map((game) {
    final gameValues = game.gameData
        .split(RegExp(r",|;"))
        .map((item) => item.trim())
        .map(getCubeValue);
    return (id: game.id, values: gameValues);
  }).toList();

  if (!part2) {
    allGames.removeWhere((element) {
      return element.values
              .where((e) => e.color == 'red' && e.value > red)
              .isNotEmpty ||
          element.values
              .where((e) => e.color == 'green' && e.value > green)
              .isNotEmpty ||
          element.values
              .where((e) => e.color == 'blue' && e.value > blue)
              .isNotEmpty;
    });

    return allGames.fold(0, (value, element) => value + getGameId(element.id));
  }

  final results = allGames.map((e) {
    final redHigh = e.values
        .where((e) => e.color == 'red')
        .fold(0, (p, e) => p > e.value ? p : e.value);
    final blueHigh = e.values
        .where((e) => e.color == 'blue')
        .fold(0, (p, e) => p > e.value ? p : e.value);
    final greenHigh = e.values
        .where((e) => e.color == 'green')
        .fold(0, (p, e) => p > e.value ? p : e.value);

    print("red $redHigh blue $blueHigh green $greenHigh");
    return redHigh * blueHigh * greenHigh;
  }).reduce((value, element) => value + element);

  return results;
}

const red = 12;
const green = 13;
const blue = 14;

//Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green

({String color, int value}) getCubeValue(String str) {
  final split = str.split(' ');
  final color = split[1];
  final value = int.parse(split[0]);
  return (color: color, value: value);
}

int getGameId(String str) {
  // get last char of string

  return int.parse(str.split(" ")[1]);
}

({String id, String gameData}) gameMapper(String str) {
  final split = str.split(':');
  return (id: split[0], gameData: split[1]);
}

List<String> splitInputToLine(String input) {
  return input.split('\n');
}
