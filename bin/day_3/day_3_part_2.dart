import 'package:meta/meta.dart';

import '../utils.dart';

void main(List<String> arguments) async {
  final schematicLines = await loadStringsFromFile('assets/engine_schematic.txt');
  final totalLines = schematicLines.length;

  final allGearRatios = <int>[];
  for (int index = 0; index < schematicLines.length; index++) {
    final line = schematicLines[index];
    final starMatches = findStars(line);

    final gearRatios = starMatches
        .map(
          (match) {
            return getTwoAdjacentNumbers(
              currentLine: line,
              previousLine: index > 0 ? schematicLines[index - 1] : null,
              nextLine: index < totalLines - 1 ? schematicLines[index + 1] : null,
              match: match,
            );
          },
        )
        .where((adjacentNumbers) => adjacentNumbers != null)
        .map((gearNumbers) => gearNumbers!.$1 * gearNumbers.$2);

    allGearRatios.addAll(gearRatios);
  }

  final sumOfRatios = allGearRatios.fold(0, (previousValue, element) => previousValue + element);
  print('Day 3 part 2: The sum of all gear ratios is: $sumOfRatios');
}

@visibleForTesting
(int firstNumber, int secondNumber)? getTwoAdjacentNumbers({
  required String currentLine,
  required String? previousLine,
  required String? nextLine,
  required RegExpMatch match,
}) {
  final currentLineLength = currentLine.length;

  List<int> adjacentNumbers = [];
  if (previousLine != null) {
    final matches = adjacentMatchesInLine(
      lineUnderInvestigation: previousLine,
      match: match,
      starLineLength: currentLineLength,
    );
    if (matches.length > 2) return null;

    final numbers = matches.map((match) => int.parse(match.group(0)!));
    adjacentNumbers.addAll(numbers);
  }

  if (nextLine != null) {
    final matches = adjacentMatchesInLine(
      lineUnderInvestigation: nextLine,
      match: match,
      starLineLength: currentLineLength,
    );
    if (matches.length > 2) return null;

    final numbers = matches.map((match) => int.parse(match.group(0)!));
    adjacentNumbers.addAll(numbers);
  }

  final matches = adjacentMatchesInLine(
    lineUnderInvestigation: currentLine,
    match: match,
    starLineLength: currentLineLength,
  );

  final numbers = matches.map((match) => int.parse(match.group(0)!));
  adjacentNumbers.addAll(numbers);

  if (adjacentNumbers.length != 2) return null;
  return (adjacentNumbers[0], adjacentNumbers[1]);
}

@visibleForTesting
List<RegExpMatch> adjacentMatchesInLine({
  required String lineUnderInvestigation,
  required RegExpMatch match,
  required int starLineLength,
}) {
  final matchIndex = match.start;

  final numbersMatches = _findNumbers(lineUnderInvestigation);

  final numbers = numbersMatches.where((numberMatch) {
    for (int i = numberMatch.start; i < numberMatch.end; i++) {
      if (i >= matchIndex - 1 && i <= matchIndex + 1) {
        return true;
      }
    }
    return false;
  }).toList(growable: false);

  return numbers;
}

@visibleForTesting
List<RegExpMatch> findStars(String line) => RegExp(r'\*').allMatches(line).toList(growable: false);
List<RegExpMatch> _findNumbers(String line) => RegExp(r'\d+').allMatches(line).toList(growable: false);
