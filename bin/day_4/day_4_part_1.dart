import '../models/scratch_card.dart';
import '../utils.dart';

void main() async {
  final rawScratchCards = await loadStringsFromFile('assets/scratch_cards.txt');

  final scratchCards = rawScratchCards.map((rawScratchCard) => ScratchCard.fromString(rawScratchCard));

  int totalPoints = scratchCards.map((card) => card.totalPoints).fold(0, (previous, current) => previous + current);

  print('Day 4 part 1: The total points are: $totalPoints');
}
