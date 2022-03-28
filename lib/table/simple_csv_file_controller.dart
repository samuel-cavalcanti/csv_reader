import 'package:csv_reader/core/csv_file.dart';
import 'package:csv_reader/core/csv_file_controller.dart';
import 'package:flutter/material.dart';

import 'simple_csv_file.dart';

class SimpleCsvFileController extends ChangeNotifier
    implements CsvFileController {
  CsvFile? _csvFile;
  List<String>? _headers;

  List<List<String>>? _table;

  CsvFileLoadStatus _loadStatus = CsvFileLoadStatus.idle;

  @override
  String? get fileName => _csvFile?.fileName;

  @override
  CsvFileLoadStatus get status => _loadStatus;

  @override
  List<String>? get headers => _headers;

  @override
  List<List<String>>? get table => _table;

  @override
  Future<void> loadCsvFile(String filePath) async {
    _loadStatus = CsvFileLoadStatus.loading;
    try {
      await _tryToLoadFile(filePath);
      _loadStatus = CsvFileLoadStatus.success;
    } catch (error) {
      _loadStatus = CsvFileLoadStatus.fail;
    }

    notifyListeners();
  }

  Future<void> _tryToLoadFile(String filePath) async {
    _csvFile = SimpleCsvFile(filePath);
    await _csvFile!.read();

    _headers = await _csvFile?.headers;

    _table = await _csvFile?.table;
  }
}
