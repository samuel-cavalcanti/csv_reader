import 'package:csv_reader/core/FilePathProviderController.dart';
import 'package:csv_reader/home/CsvFilePathPickerController.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/MockPathFileProvider.dart';

void main() {
  group('CsvFilePathPickerController', () {
    test('test Controller onPress ', () async {
      final mock = MockPathFileProvider();
      final controller = CsvFilePathPickerController(mock);

      expect(controller.status, FilePathProviderControllerStatus.idle);
      expect(controller.filePath, null);

      final futureVoid = controller.callProvider();

      expect(controller.status, FilePathProviderControllerStatus.picking);
      expect(controller.filePath, null);

      await futureVoid;

      expect(controller.status, FilePathProviderControllerStatus.picked);

      expect(controller.filePath, mock.pathFile);
    });
  });
}
