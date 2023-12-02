import 'package:meta/meta.dart';

import '../extensions/string_extension.dart';
import '../models/calibration_numbers.dart';
import '../utils.dart';

void main(List<String> arguments) async {
  final calibrations = await loadStringsFromFile('assets/calibration_codes.txt');

  int calibrationSum = 0;
  for (final calibration in calibrations) {
    final calibrationNumbers = extractCalibrationNumbers(calibration);
    if (calibrationNumbers == null) continue;
    calibrationSum += calibrationNumbers.merged;
  }

  print('Day 1 part 2: The sum of all calibrations is: $calibrationSum');
}

@visibleForTesting
CalibrationNumbers? extractCalibrationNumbers(String calibration) {
  final firstNumber = _extractFirstNumber(calibration);
  final lastNumber = _extractLastNumber(calibration);

  if (firstNumber == null || lastNumber == null) return null;

  return CalibrationNumbers(first: firstNumber, second: lastNumber);
}

int? _extractFirstNumber(String calibration) {
  final numbersInWordsPattern = numbersInWordsMap.keys.join('|');
  final pattern = '\\d|$numbersInWordsPattern';
  final match = RegExp(pattern).firstMatch(calibration);

  if (match == null) return null;

  return _convertNumberIntoInt(match.group(0)!);
}

int? _extractLastNumber(String calibration) {
  final numbersInWordsReversedPattern = numbersInWordsMap.keys.map((word) => word.reverse()).join('|');
  final pattern = '\\d|$numbersInWordsReversedPattern';
  final match = RegExp(pattern).firstMatch(calibration.reverse());

  if (match == null) return null;

  return _convertReversedNumberIntoInt(match.group(0)!);
}

int _convertNumberIntoInt(String number) => numbersInWordsMap[number] ?? int.parse(number);
int _convertReversedNumberIntoInt(String number) => numbersInWordsMap[number.reverse()] ?? int.parse(number);

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
