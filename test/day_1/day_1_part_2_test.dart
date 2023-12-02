import 'package:test/test.dart';

import '../../bin/day_1/day_1_part_2.dart';
import '../../bin/models/calibration_numbers.dart';

void main() {
  test('extractCalibrationNumbers', () {
    expect(extractCalibrationNumbers(''), isNull);
    expect(extractCalibrationNumbers('calibration'), isNull);
    expect(extractCalibrationNumbers('one'), CalibrationNumbers(first: 1, second: 1));
    expect(extractCalibrationNumbers('oneone'), CalibrationNumbers(first: 1, second: 1));
    expect(extractCalibrationNumbers('two'), CalibrationNumbers(first: 2, second: 2));
    expect(extractCalibrationNumbers('onetwo'), CalibrationNumbers(first: 1, second: 2));
    expect(extractCalibrationNumbers('three'), CalibrationNumbers(first: 3, second: 3));
    expect(extractCalibrationNumbers('four'), CalibrationNumbers(first: 4, second: 4));
    expect(extractCalibrationNumbers('five'), CalibrationNumbers(first: 5, second: 5));
    expect(extractCalibrationNumbers('six'), CalibrationNumbers(first: 6, second: 6));
    expect(extractCalibrationNumbers('seven'), CalibrationNumbers(first: 7, second: 7));
    expect(extractCalibrationNumbers('eight'), CalibrationNumbers(first: 8, second: 8));
    expect(extractCalibrationNumbers('nine'), CalibrationNumbers(first: 9, second: 9));
    expect(extractCalibrationNumbers('calibration1'), CalibrationNumbers(first: 1, second: 1));
    expect(extractCalibrationNumbers('calibration1calibration2'), CalibrationNumbers(first: 1, second: 2));
    expect(extractCalibrationNumbers('cone2nine'), CalibrationNumbers(first: 1, second: 9));
    expect(extractCalibrationNumbers('qtwonesixtwosixvjmnhqbbx5'), CalibrationNumbers(first: 2, second: 5));
    expect(extractCalibrationNumbers('2twoneh'), CalibrationNumbers(first: 2, second: 1));
    expect(extractCalibrationNumbers('nineight'), CalibrationNumbers(first: 9, second: 8));
  });
}
