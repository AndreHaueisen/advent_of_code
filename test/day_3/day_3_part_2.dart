import 'package:test/test.dart';

import '../../bin/day_3/day_3_part_2.dart';

void main() {
  //.....786....
  //.......*....
  //....615.....
  test('adjacentMatchesInLine - one', () {
    final starMatches = findStars('.......*....');

    final firstLineResults = adjacentMatchesInLine(
      lineUnderInvestigation: '....786.....',
      match: starMatches.first,
      starLineLength: 12,
    );

    expect(firstLineResults.length, 1);
    expect(firstLineResults.first.group(0), '786');

    final secondLineResults = adjacentMatchesInLine(
      lineUnderInvestigation: '.......*....',
      match: starMatches.first,
      starLineLength: 12,
    );

    expect(secondLineResults.length, 0);

    final thirdLineResults = adjacentMatchesInLine(
      lineUnderInvestigation: '....615.....',
      match: starMatches.first,
      starLineLength: 12,
    );

    expect(thirdLineResults.length, 1);
    expect(thirdLineResults.first.group(0), '615');
  });

  //.....786....
  //.......*....
  //....615.....
  test('getTwoAdjacentNumbers - one', () {
    (int firstNumber, int secondNumber)? results = getTwoAdjacentNumbers(
      currentLine: '.......*....',
      previousLine: '....786.....',
      nextLine: '....615.....',
      match: findStars('.......*....').first,
    );

    expect(results?.$1, 786);
    expect(results?.$2, 615);
  });

  //.....78.9...
  //.......*3...
  //....61......
  test('adjacentMatchesInLine - two', () {
    final starMatches = findStars('.......*3...');

    final firstLineResults = adjacentMatchesInLine(
      lineUnderInvestigation: '.....78.9...',
      match: starMatches.first,
      starLineLength: 12,
    );

    expect(firstLineResults.length, 2);
    expect(firstLineResults.first.group(0), '78');
    expect(firstLineResults.last.group(0), '9');

    final secondLineResults = adjacentMatchesInLine(
      lineUnderInvestigation: '.......*3...',
      match: starMatches.first,
      starLineLength: 12,
    );

    expect(secondLineResults.length, 1);
    expect(secondLineResults.first.group(0), '3');

    final thirdLineResults = adjacentMatchesInLine(
      lineUnderInvestigation: '....61......',
      match: starMatches.first,
      starLineLength: 12,
    );

    expect(thirdLineResults.length, 0);
  });

  //.....78.9...
  //.......*3...
  //....61......
  test('getTwoAdjacentNumbers - two', () {
    (int firstNumber, int secondNumber)? results = getTwoAdjacentNumbers(
      currentLine: '.......*3...',
      previousLine: '.....78.9...',
      nextLine: '....61......',
      match: findStars('.......*3...').first,
    );

    expect(results, isNull);
  });

  //.....78.9...
  //......1*3...
  //....61.29...
  test('adjacentMatchesInLine - three', () {
    final starMatches = findStars('......1*3...');

    final firstLineResults = adjacentMatchesInLine(
      lineUnderInvestigation: '.....78.9...',
      match: starMatches.first,
      starLineLength: 12,
    );

    expect(firstLineResults.length, 2);
    expect(firstLineResults.first.group(0), '78');
    expect(firstLineResults.last.group(0), '9');

    final secondLineResults = adjacentMatchesInLine(
      lineUnderInvestigation: '......1*3...',
      match: starMatches.first,
      starLineLength: 12,
    );

    expect(secondLineResults.length, 2);
    expect(secondLineResults.first.group(0), '1');
    expect(secondLineResults.last.group(0), '3');

    final thirdLineResults = adjacentMatchesInLine(
      lineUnderInvestigation: '....61.29...',
      match: starMatches.first,
      starLineLength: 12,
    );

    expect(thirdLineResults.length, 1);
    expect(thirdLineResults.first.group(0), '29');
  });

  //.....78.9...
  //......1*3...
  //....61.29...
  test('getTwoAdjacentNumbers - three', () {
    (int firstNumber, int secondNumber)? results = getTwoAdjacentNumbers(
      currentLine: '......1*3...',
      previousLine: '.....78.9...',
      nextLine: '....61.29...',
      match: findStars('......1*3...').first,
    );

    expect(results, isNull);
  });

  //......780...
  //.......*....
  //......029...
  test('adjacentMatchesInLine - four', () {
    final starMatches = findStars('.......*....');

    final firstLineResults = adjacentMatchesInLine(
      lineUnderInvestigation: '......780...',
      match: starMatches.first,
      starLineLength: 12,
    );

    expect(firstLineResults.length, 1);
    expect(firstLineResults.first.group(0), '780');

    final secondLineResults = adjacentMatchesInLine(
      lineUnderInvestigation: '.......*....',
      match: starMatches.first,
      starLineLength: 12,
    );

    expect(secondLineResults.length, 0);

    final thirdLineResults = adjacentMatchesInLine(
      lineUnderInvestigation: '......029...',
      match: starMatches.first,
      starLineLength: 12,
    );

    expect(thirdLineResults.length, 1);
    expect(thirdLineResults.first.group(0), '029');
  });

  //......780...
  //.......*....
  //......029...
  test('getTwoAdjacentNumbers - four', () {
    (int firstNumber, int secondNumber)? results = getTwoAdjacentNumbers(
      currentLine: '.......*....',
      previousLine: '......780...',
      nextLine: '......029...',
      match: findStars('.......*....').first,
    );

    expect(results?.$1, 780);
    expect(results?.$2, 029);
  });

  //......7*.89.
  //......35....
  test('adjacentMatchesInLine - five', () {
    final starMatches = findStars('......7*.89.');

    final firstLineResults = adjacentMatchesInLine(
      lineUnderInvestigation: '......7*.89.',
      match: starMatches.first,
      starLineLength: 12,
    );

    expect(firstLineResults.length, 1);
    expect(firstLineResults.first.group(0), '7');

    final secondLineResults = adjacentMatchesInLine(
      lineUnderInvestigation: '......35....',
      match: starMatches.first,
      starLineLength: 12,
    );

    expect(secondLineResults.length, 1);
    expect(secondLineResults.first.group(0), '35');
  });

  //......7*.89.
  //......35....
  test('getTwoAdjacentNumbers - five', () {
    (int firstNumber, int secondNumber)? results = getTwoAdjacentNumbers(
      currentLine: '......7*.89.',
      previousLine: null,
      nextLine: '......35....',
      match: findStars('......7*.89.').first,
    );

    expect(results?.$1, 35);
    expect(results?.$2, 7);
  });
}
