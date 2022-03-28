enum CsvFileLoadStatus {
  loading,
  success,
  fail,
  idle,
}

abstract class CsvFileController {
  CsvFileLoadStatus get status;

  String? get fileName;

  List<String>? get headers;

  List<List<String>>? get table;

  Future<void> loadCsvFile(String filePath);
}
