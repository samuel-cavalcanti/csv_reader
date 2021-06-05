abstract class CsvFile {
  Future<List<String>> get headers;

  Future<List<List<String>>> get table;

  Future<void> read();

  String get fileName;

  String get path;
}
