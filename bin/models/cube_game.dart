import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

class CubeGame extends Equatable {
  final int id;
  final List<CubeGrab> grabs;

  const CubeGame({required this.id, required this.grabs});

  factory CubeGame.fromString(String rawGame) {
    final splitGame = rawGame.split(':');
    final id = int.parse(RegExp(r'(\d+)').stringMatch(splitGame[0])!);
    final rawGrabs = splitGame[1].split(';').map((grab) => grab.trim());
    final grabs = rawGrabs.map((rawGrab) => CubeGrab.fromString(rawGrab)).toList();

    return CubeGame(id: id, grabs: grabs);
  }

  bool isValid({
    required int maxRed,
    required int maxGreen,
    required int maxBlue,
  }) =>
      !grabs.any((grab) => !grab.isValid(maxRed: maxRed, maxGreen: maxGreen, maxBlue: maxBlue));

  @override
  List<Object> get props => [id, grabs];
}

class CubeGrab extends Equatable {
  final ColorQuantity? reds;
  final ColorQuantity? greens;
  final ColorQuantity? blues;

  const CubeGrab({required this.reds, required this.greens, required this.blues});

  factory CubeGrab.fromString(String rawGrab) {
    final rawColorQuantities = rawGrab.split(',').map((grab) => grab.trim());

    final colorQuantities = rawColorQuantities.map(
      (rawColorQuantity) => ColorQuantity.fromString(rawColorQuantity),
    );

    final reds = colorQuantities.firstWhereOrNull((colorQuantity) => colorQuantity.color == Color.red);
    final greens = colorQuantities.firstWhereOrNull((colorQuantity) => colorQuantity.color == Color.green);
    final blues = colorQuantities.firstWhereOrNull((colorQuantity) => colorQuantity.color == Color.blue);

    return CubeGrab(reds: reds, greens: greens, blues: blues);
  }

  bool isValid({
    required int maxRed,
    required int maxGreen,
    required int maxBlue,
  }) =>
      (reds?.quantity ?? 0) <= maxRed && (greens?.quantity ?? 0) <= maxGreen && (blues?.quantity ?? 0) <= maxBlue;

  @override
  List<Object?> get props => [reds, greens, blues];
}

class ColorQuantity extends Equatable {
  final Color color;
  final int quantity;

  const ColorQuantity({required this.color, required this.quantity});

  factory ColorQuantity.fromString(String rawColorQuantity) {
    final splitColorQuantity = rawColorQuantity.split(' ');
    final quantity = int.parse(splitColorQuantity[0]);
    final color = Color.fromString(splitColorQuantity[1].trim());

    return ColorQuantity(color: color, quantity: quantity);
  }

  @override
  List<Object> get props => [color, quantity];
}

enum Color {
  red,
  green,
  blue;

  static Color fromString(String rawColor) {
    switch (rawColor) {
      case 'red':
        return Color.red;
      case 'green':
        return Color.green;
      case 'blue':
        return Color.blue;
      default:
        throw ArgumentError('Invalid color: $rawColor');
    }
  }
}
