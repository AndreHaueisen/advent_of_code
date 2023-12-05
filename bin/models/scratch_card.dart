import 'dart:collection';

import 'package:equatable/equatable.dart';

class ScratchCard extends Equatable {
  static const _spaceRegex = r'\s+';
  final String id;
  final HashSet<int> myNumbers;
  final HashSet<int> winningNumbers;

  const ScratchCard({
    required this.id,
    required this.myNumbers,
    required this.winningNumbers,
  });

  factory ScratchCard.fromString(String rawScratchCard) {
    final splitScratchCard = rawScratchCard.split(':');
    final id = splitScratchCard[0];
    final rawNumbers = splitScratchCard[1].split('|');

    final regex = RegExp(_spaceRegex);
    final rawMyNumbers = rawNumbers[0].trim().split(regex).map((number) => int.parse(number.trim()));
    final rawWinningNumbers = rawNumbers[1].trim().split(regex).map((number) => int.parse(number.trim()));

    final myNumbers = HashSet<int>.from(rawMyNumbers);
    final winningNumbers = HashSet<int>.from(rawWinningNumbers);

    return ScratchCard(id: id, myNumbers: myNumbers, winningNumbers: winningNumbers);
  }

  int get totalPoints {
    final intersection = myNumbers.intersection(winningNumbers);

    if (intersection.isEmpty) return 0;

    int points = 1;

    for (int i = 0; i < intersection.length - 1; i++) {
      points *= 2;
    }

    return points;
  }

  @override
  List<Object> get props => [id, myNumbers, winningNumbers];
}
