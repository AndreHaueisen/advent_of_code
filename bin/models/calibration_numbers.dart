class CalibrationNumbers {
  final int first;
  final int second;

  const CalibrationNumbers({required this.first, required this.second});

  int get merged => int.parse('$first$second');
}
