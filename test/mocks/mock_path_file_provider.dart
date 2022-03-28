import 'package:csv_reader/core/path_file_provider.dart';

class MockPathFileProvider extends PathFileProvider {
  final pathFile = 'test';

  @override
  Future<String?> getPathFile() async {
    return Future.delayed(const Duration(microseconds: 10), () => pathFile);
  }
}
