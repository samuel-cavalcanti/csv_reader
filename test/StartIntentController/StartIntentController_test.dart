import 'package:csv_reader/Splash/StartIntentController.dart';
import 'package:csv_reader/core/FilePathProviderController.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/MockPathFileProvider.dart';

void main() {
  group('StartIntentController', () {
    test('check status StartIntentController', () async {
      final mock = MockPathFileProvider();
      final controller = StartIntentController(mock);

      expect(controller.status, FilePathProviderControllerStatus.picking);
      expect(controller.filePath, null);

      await controller.callProvider();

      expect(controller.status, FilePathProviderControllerStatus.picked);
      expect(controller.filePath, mock.pathFile);
    });
  });
}
