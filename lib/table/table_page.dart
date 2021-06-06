import 'package:csv_reader/table/CsvDataTable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SimpleCsvFileController.dart';

class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  String _filePath = 'Fail';

  @override
  void initState() {
    super.initState();

    print('$_filePath');
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as String;
    final controller = context.read<SimpleCsvFileController>();

    controller.loadCsvFile(arguments);

    final title =
        controller.fileName == null ? 'CSV Reader' : controller.fileName!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: CsvDataTable(),
    );
  }
}
