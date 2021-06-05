import 'package:csv_reader/core/PathFileProvider.dart';

class MockPathFileProvider extends PathFileProvider {
  final pathFile = 'test';

  @override
  Future<String?> getPathFile() async {
    return Future.delayed(Duration(microseconds: 10), () => pathFile);
  }
}
