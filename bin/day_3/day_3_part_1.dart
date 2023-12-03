import '../utils.dart';

// Symbols (*!/=&+#$%-@) regex
const symbolsRegExp = r'[\*\!\/\=\&\+\#\$\%\-\@\(\)]';

void main(List<String> arguments) async {
  final schematicLines = await loadStringsFromFile('assets/engine_schematic.txt');
  final totalLines = schematicLines.length;

  final partNumbers = <int>[];
  for (int index = 0; index < schematicLines.length; index++) {
    final line = schematicLines[index];
    final numberMatches = _findNumbers(line);

    final numbers = numberMatches
        .where(
          (match) => _isAdjacentToSymbol(
            currentLine: line,
            previousLine: index > 0 ? schematicLines[index - 1] : null,
            nextLine: index < totalLines - 1 ? schematicLines[index + 1] : null,
            match: match,
          ),
        )
        .map((match) => int.parse(match.group(0)!));

    print('line: $line, numbers: $numbers');
    partNumbers.addAll(numbers);
  }

  final sumOfParts = partNumbers.fold(0, (previousValue, element) => previousValue + element);
  print('Day 3 part 1: The sum of all part numbers is: $sumOfParts');
}

List<RegExpMatch> _findNumbers(String line) => RegExp(r'(\d+)').allMatches(line).toList(growable: false);

bool _isAdjacentToSymbol({
  required String currentLine,
  required String? previousLine,
  required String? nextLine,
  required RegExpMatch match,
}) {
  final currentLineLength = currentLine.length;

  if (previousLine != null) {
    final hasSymbolMatch = _hasAdjacentSymbolsInLine(
      lineUnderInvestigation: previousLine,
      match: match,
      numberLineLength: currentLineLength,
    );
    if (hasSymbolMatch) return true;
  }

  if (nextLine != null) {
    final hasSymbolMatch = _hasAdjacentSymbolsInLine(
      lineUnderInvestigation: nextLine,
      match: match,
      numberLineLength: currentLineLength,
    );
    if (hasSymbolMatch) return true;
  }

  return _hasAdjacentSymbolsInLine(
    lineUnderInvestigation: currentLine,
    match: match,
    numberLineLength: currentLineLength,
  );
}

bool _hasAdjacentSymbolsInLine({
  required String lineUnderInvestigation,
  required RegExpMatch match,
  required int numberLineLength,
}) {
  final matchStartIndex = match.start;
  final matchEndIndex = match.end;

  final lineSubstringStartIndex = (matchStartIndex - 1).clamp(0, numberLineLength);
  final lineSubstringEndIndex = (matchEndIndex + 1).clamp(0, numberLineLength);

  final lineSubstring = lineUnderInvestigation.substring(lineSubstringStartIndex, lineSubstringEndIndex);
  return RegExp(symbolsRegExp).hasMatch(lineSubstring);
}
