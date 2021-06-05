import 'package:csv_reader/core/PathFileProvider.dart';
import 'package:file_picker/file_picker.dart';

class CsvFilePicker implements PathFileProvider {
  @override
  Future<String?> getPathFile() async {
    final filePickerResult = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['csv']);

    return filePickerResult?.files.single.path;
  }
}
