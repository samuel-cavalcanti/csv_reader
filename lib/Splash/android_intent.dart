import 'package:csv_reader/core/path_file_provider.dart';
import 'package:flutter/services.dart';

class AndroidIntent extends PathFileProvider {
  final _channel = const MethodChannel('intent.open.file');

  @override
  Future<String?> getPathFile() async {
    try {
      return await _channel.invokeMethod('getFilePath');
    } on PlatformException {
      return null;
    }
  }
}
