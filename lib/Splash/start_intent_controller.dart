import 'package:csv_reader/core/file_path_provider_controller.dart';
import 'package:csv_reader/core/path_file_provider.dart';
import 'package:flutter/foundation.dart';

class StartIntentController extends ChangeNotifier
    implements FilePathProviderController {
      
  @override
  FilePathProviderControllerStatus status =
      FilePathProviderControllerStatus.picking;
  String? _filePath;
  final PathFileProvider provider;

  StartIntentController(this.provider) {
    callProvider();
  }

  @override
  Future<void> callProvider() async {
    _filePath = await provider.getPathFile();
    status = filePath == null
        ? FilePathProviderControllerStatus.idle
        : FilePathProviderControllerStatus.picked;

    notifyListeners();
  }

  @override
  String? get filePath => _filePath;
}
