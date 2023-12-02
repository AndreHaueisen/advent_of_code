import '../models/calibration_numbers.dart';
import '../utils.dart';

void main(List<String> arguments) async {
  final calibrations = await loadStringsFromFile('assets/calibration_codes.txt');

  int calibrationSum = 0;
  for (final calibration in calibrations) {
    final calibrationNumbers = _extractCalibrationNumbers(calibration);
    if (calibrationNumbers == null) continue;
    calibrationSum += calibrationNumbers.merged;
  }

  print('Day 1 part 1: The sum of all calibrations is: $calibrationSum');
}

CalibrationNumbers? _extractCalibrationNumbers(String calibration) {
  final singleDigitNumbersRegExp = r'\d';
  final matches = RegExp(singleDigitNumbersRegExp).allMatches(calibration).toList();

  if (matches.isEmpty) return null;

  final firstNumber = int.parse(matches.first.group(0)!);
  final lastNumber = int.parse(matches.last.group(0)!);
  return CalibrationNumbers(first: firstNumber, second: lastNumber);
}
