import '../models/cube_game.dart';
import '../utils.dart';

void main(List<String> arguments) async {
  final rawGames = await loadStringsFromFile('assets/cube_game_inputs.txt');

  final allGames = rawGames.map((rawGame) => CubeGame.fromString(rawGame)).toList();

  int sumOfPowers = 0;
  for (final game in allGames) {
    final (minimumRed, minimumGreen, minimumBlue) = game.minimumViableQuantities;

    sumOfPowers += minimumRed * minimumGreen * minimumBlue;
  }

  print('Day 2 part 1: The sum of powers is: $sumOfPowers');
}
