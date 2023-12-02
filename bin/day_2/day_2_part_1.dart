// Bag of cubes: 12 - red
//               13 - green
//               14 - blue
import '../models/cube_game.dart';
import '../utils.dart';

const maxRed = 12;
const maxGreen = 13;
const maxBlue = 14;

void main(List<String> arguments) async {
  final rawGames = await loadStringsFromFile('assets/cube_game_inputs.txt');

  final validGames = rawGames.map((rawGame) => CubeGame.fromString(rawGame)).where((cubeGame) {
    return cubeGame.isValid(
      maxRed: maxRed,
      maxGreen: maxGreen,
      maxBlue: maxBlue,
    );
  }).toList();

  final totalSum = validGames.fold(0, (previousValue, element) => previousValue + element.id);
  print('Day 2 part 1: The sum of all valid game ids is: $totalSum');
}
