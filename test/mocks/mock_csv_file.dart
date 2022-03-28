import 'package:csv_reader/core/csv_file.dart';

class MockCsvFile extends CsvFile {
  @override
  get fileName => 'sample0.csv';

  @override
  String get path => 'test_resources/sample0.csv';

  @override
  Future<List<String>> get headers async {
    return ['x(pixels)', 'y(pixels)', 'time(milliseconds)'];
  }

  @override
  Future<void> read() async {
    Future.delayed(const Duration(microseconds: 10));
  }

  @override
  Future<List<List<String>>> get table async {
    return [
      ['638', '358', '27'],
      ['638', '358', '156'],
      ['638', '358', '207'],
      ['638', '358', '264'],
      ['638', '358', '375'],
      ['638', '358', '471'],
      ['638', '358', '540'],
      ['638', '358', '652'],
      ['638', '358', '747'],
      ['638', '358', '815'],
      ['638', '358', '871'],
      ['638', '358', '941'],
      ['638', '358', '1010'],
      ['638', '358', '1079'],
      ['638', '358', '1147'],
      ['638', '358', '1217'],
      ['638', '358', '1286'],
      ['638', '358', '1383'],
      ['638', '358', '1450']
    ];
  }

  @override
  String toString() {
    return '''x(pixels),y(pixels),time(milliseconds)
638,358,27
638,358,156
638,358,207
638,358,264
638,358,375
638,358,471
638,358,540
638,358,652
638,358,747
638,358,815
638,358,871
638,358,941
638,358,1010
638,358,1079
638,358,1147
638,358,1217
638,358,1286
638,358,1383
638,358,1450\n''';
  }


}
