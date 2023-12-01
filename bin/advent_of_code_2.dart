import 'models/calibration_numbers.dart';
import 'utils.dart';

void main(List<String> arguments) async {
  final calibrations = await loadStringsFromFile('assets/calibration_codes.txt');

  int calibrationSum = 0;
  for (final calibration in calibrations) {
    final calibrationNumbers = _extractCalibrationNumbers(calibration);
    if (calibrationNumbers == null) continue;
    calibrationSum += calibrationNumbers.merged;
  }

  print('AOC2: The sum of all calibrations is: $calibrationSum');
}

CalibrationNumbers? _extractCalibrationNumbers(String calibration) {
  final numbersInWordsPattern = numbersInWordsMap.keys.join('|');
  final pattern = '\\d|$numbersInWordsPattern';
  final numbers = RegExp(pattern).allMatches(calibration).toList();

  if (numbers.isEmpty) return null;

  final firstNumber = _convertNumberIntoInt(numbers.first.group(0)!);
  final lastNumber = _convertNumberIntoInt(numbers.last.group(0)!);

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
