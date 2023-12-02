import 'package:test/test.dart';

import '../../bin/models/cube_game.dart';

void main() {
  test('CubeGabe', () {
    final rawGameOne = 'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green';
    final rawGameTwo = 'Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue';
    final rawGameThree = 'Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red';
    final rawGameFour = 'Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red';
    final rawGameFive = 'Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green';

    final gameOne = CubeGame.fromString(rawGameOne);
    final gameTwo = CubeGame.fromString(rawGameTwo);
    final gameThree = CubeGame.fromString(rawGameThree);
    final gameFour = CubeGame.fromString(rawGameFour);
    final gameFive = CubeGame.fromString(rawGameFive);

    expect(gameOne.minimumViableQuantities, (4, 2, 6));
    expect(gameTwo.minimumViableQuantities, (1, 3, 4));
    expect(gameThree.minimumViableQuantities, (20, 13, 6));
    expect(gameFour.minimumViableQuantities, (14, 3, 15));
    expect(gameFive.minimumViableQuantities, (6, 3, 2));
  });
}
