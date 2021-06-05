import 'package:csv_reader/core/FilePathProviderController.dart';
import 'package:csv_reader/core/PathFileProvider.dart';
import 'package:flutter/foundation.dart';

class StartIntentController extends ChangeNotifier
    implements FilePathProviderController {

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
    if (filePath == null)
      status = FilePathProviderControllerStatus.idle;
    else
      status = FilePathProviderControllerStatus.picked;
    notifyListeners();
  }

  @override
  String? get filePath => _filePath;
}
