import 'package:csv_reader/core/csv_file_controller.dart';
import 'package:csv_reader/table/simple_csv_file_controller.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_csv_file.dart';

void main() {
  group('CsvFileController', () {
    final mock = MockSample0CsvFile();

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
