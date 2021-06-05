import 'package:csv_reader/core/CsvFileController.dart';
import 'package:csv_reader/table/SimpleCsvFileController.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/MockCsvFile.dart';

void main() {
  group('CsvFileController', () {
    final mock = MockCsvFile();

    test('loading file state', () async {
      final csvFileController = SimpleCsvFileController();
      expect(csvFileController.status, CsvFileLoadStatus.idle);

      Future<void> loadFile = csvFileController.loadCsvFile(mock.path);
      expect(csvFileController.status, CsvFileLoadStatus.loading);

      await loadFile;
      expect(csvFileController.status, CsvFileLoadStatus.success);
    });

    test('fail to load file', () async {
      final csvFileController = SimpleCsvFileController();

      Future<void> loadFile = csvFileController.loadCsvFile('test fail');
      expect(csvFileController.status, CsvFileLoadStatus.loading);

      await loadFile;

      expect(csvFileController.status, CsvFileLoadStatus.fail);
    });

    test('should get headers', () async {
      final csvFileController = SimpleCsvFileController();
      expect(csvFileController.headers, null);

      await csvFileController.loadCsvFile(mock.path);

      expect(csvFileController.headers, await mock.headers);
    });

    test('should get table', () async {
      final csvFileController = SimpleCsvFileController();
      expect(csvFileController.headers, null);

      await csvFileController.loadCsvFile(mock.path);

      expect(csvFileController.table, await mock.table);
    });
  });
}
