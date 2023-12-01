import 'dart:io';

void main(List<String> arguments) async {
  final calibrations = await _loadStringsFromFile('assets/day_1.txt');

  int calibrationSum = 0;
  for (final calibration in calibrations) {
    final calibrationNumbers = _extractCalibrationNumbers(calibration);
    if (calibrationNumbers == null) continue;
    calibrationSum += calibrationNumbers.merged;
  }

  print('The sum of all calibrations is: $calibrationSum');
}

CalibrationNumbers? _extractCalibrationNumbers(String calibration) {
  final singleDigitNumbersRegExp = r'\d';
  final numbers = RegExp(singleDigitNumbersRegExp).allMatches(calibration).toList();

  if (numbers.isEmpty) return null;

  final firstNumber = int.parse(numbers.first.group(0)!);
  final lastNumber = int.parse(numbers.last.group(0)!);
  return CalibrationNumbers(first: firstNumber, second: lastNumber);
}

Future<List<String>> _loadStringsFromFile(String filePath) async {
  final file = File(filePath);

  try {
    final lines = await file.readAsLines();
    return lines;
  } catch (e) {
    print('An error occurred while reading the file: $e');
    return [];
  }
}

class CalibrationNumbers {
  final int first;
  final int second;

  const CalibrationNumbers({required this.first, required this.second});

  int get merged => int.parse('$first$second');
}
