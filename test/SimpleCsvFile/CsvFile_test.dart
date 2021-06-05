import 'package:csv_reader/table/SimpleCsvFile.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/MockCsvFile.dart';

void main() {
  group('CsvFile', () {
    final mockCsvFile = MockCsvFile();

    test('should loading CSV file', () async {
      final csvFile = SimpleCsvFile(mockCsvFile.path);

      await csvFile.read();

      expect(csvFile.path, mockCsvFile.path);
      expect(csvFile.toString(), mockCsvFile.toString());
    });

    test('should get header', () async {
      final csvFile = SimpleCsvFile(mockCsvFile.path);

      final headers = await csvFile.headers;

      expect(await mockCsvFile.headers, headers);
    });

    test('should get table ', () async {
      final csvFile = SimpleCsvFile(mockCsvFile.path);

      final table = await csvFile.table;
      final mockTable = await mockCsvFile.table;

      expect(mockTable.length, table.length);
      expect(mockTable, table);
    });

    test('should get file name ', () async {
      final csvFile = SimpleCsvFile(mockCsvFile.path);

      final name = csvFile.fileName;

      expect(mockCsvFile.fileName, name);
    });
  });
}
