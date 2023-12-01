import 'package:meta/meta.dart';

import 'models/calibration_numbers.dart';
import 'utils.dart';

void main(List<String> arguments) async {
  final calibrations = await loadStringsFromFile('assets/calibration_codes.txt');

  int calibrationSum = 0;
  for (final calibration in calibrations) {
    final calibrationNumbers = extractCalibrationNumbers(calibration);
    if (calibrationNumbers == null) continue;
    calibrationSum += calibrationNumbers.merged;
  }

  print('AOC2: The sum of all calibrations is: $calibrationSum');
}

@visibleForTesting
CalibrationNumbers? extractCalibrationNumbers(String calibration) {
  final numbersInWordsPattern = numbersInWordsMap.keys.join('|');
  final pattern = '\\d|$numbersInWordsPattern';
  final matches = RegExp(pattern).allMatches(calibration).toList();

  if (matches.isEmpty) return null;

  final firstNumber = _convertNumberIntoInt(matches.first.group(0)!);
  final lastNumber = _convertNumberIntoInt(matches.last.group(0)!);

  print('firstNumber: $firstNumber, lastNumber: $lastNumber');

  return CalibrationNumbers(first: firstNumber, second: lastNumber);
}

int _convertNumberIntoInt(String number) {
  final parsedNumber = int.tryParse(number);

  if (parsedNumber != null) return parsedNumber;

  return _convertNumberInWordToNumber(number);
}

int _convertNumberInWordToNumber(String numberInWord) => numbersInWordsMap[numberInWord]!;

final numbersInWordsMap = {
  'one': 1,
  'two': 2,
  'three': 3,
  'four': 4,
  'five': 5,
  'six': 6,
  'seven': 7,
  'eight': 8,
  'nine': 9
};
