import 'package:csv_reader/Splash/start_intent_controller.dart';
import 'package:csv_reader/core/file_path_provider_controller.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_path_file_provider.dart';

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
