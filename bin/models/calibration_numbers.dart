import 'package:equatable/equatable.dart';

class CalibrationNumbers extends Equatable {
  final int first;
  final int second;

  const CalibrationNumbers({required this.first, required this.second});

  int get merged => int.parse('$first$second');

  @override
  List<Object> get props => [first, second];
}
