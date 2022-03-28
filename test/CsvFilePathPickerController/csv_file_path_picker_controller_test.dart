import 'package:csv_reader/core/file_path_provider_controller.dart';
import 'package:csv_reader/home/csv_file_path_picker_controller.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_path_file_provider.dart';

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
