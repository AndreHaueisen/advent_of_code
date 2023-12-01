import 'dart:io';

Future<List<String>> loadStringsFromFile(String filePath) async {
  final file = File(filePath);

  try {
    final lines = await file.readAsLines();
    return lines;
  } catch (e) {
    print('An error occurred while reading the file: $e');
    return [];
  }
}
