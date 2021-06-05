enum FilePathProviderControllerStatus { idle, picking, picked }

abstract class FilePathProviderController {
  Future<void> callProvider();

  FilePathProviderControllerStatus get status;

  String? get filePath;
}
