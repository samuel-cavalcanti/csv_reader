import 'package:csv_reader/core/FilePathProviderController.dart';
import 'package:csv_reader/core/PathFileProvider.dart';
import 'package:flutter/material.dart';

class CsvFilePathPickerController extends ChangeNotifier
    implements FilePathProviderController {
  FilePathProviderControllerStatus _status = FilePathProviderControllerStatus.idle;
  String? _filePath;
  final PathFileProvider _picker;

  CsvFilePathPickerController(this._picker);

  Future<void> callProvider() async {
    _status = FilePathProviderControllerStatus.picking;
    notifyListeners();

    _filePath = await _picker.getPathFile();

    if (_filePath == null) {
      _status = FilePathProviderControllerStatus.idle;
      notifyListeners();
      return;
    }

    _status = FilePathProviderControllerStatus.picked;

    notifyListeners();
  }

  @override
  FilePathProviderControllerStatus get status => _status;

  @override
  String? get filePath => _filePath;
}
