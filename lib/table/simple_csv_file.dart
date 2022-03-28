import 'dart:io';

import '../core/csv_file.dart';

class SimpleCsvFile extends CsvFile {
  final String _filePath;

  String _content = '';
  late final String _fileName;
  late List<String> _headers;
  List<List<String>> _table = [];

  bool _loaded = false;

  SimpleCsvFile(this._filePath) {
    _fileName = _filePath.split('/').last;
  }

  @override
  Future<List<String>> get headers async {
    if (_loaded) return _headers;

    await read();

    return _headers;
  }

  @override
  Future<List<List<String>>> get table async {
    if (_loaded) return _table;

    await read();

    return _table;
  }

  @override
  String get fileName => _fileName;

  @override
  String get path => _filePath;

  @override
  Future<void> read() async {
    final csvFile = File(_filePath);

    _content = await csvFile.readAsString();
    _loaded = true;

    final lines = _content.split('\n');
    if (_recoverHeader(lines.first)) lines.removeAt(0);

    _table = lines
        .where((element) => element.isNotEmpty)
        .map(_mapLineToListOfStrings)
        .toList();
  }

  List<String> _mapLineToListOfStrings(String line) {
    if (line.isEmpty) return [];
    return line.split(',');
  }

  bool _recoverHeader(String firstLine) {
    final possibleHeaders = firstLine.split(',');

    final possibleNumber = double.tryParse(possibleHeaders.first);

    if (possibleNumber != null) return false;

    _headers = possibleHeaders;

    return true;
  }

  @override
  String toString() {
    return _content;
  }
}
