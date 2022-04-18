import 'package:csv_reader/core/csv_file_controller.dart';
import 'package:csv_reader/table/csv_data_table.dart';
import 'package:csv_reader/table/simple_csv_file_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final csvFilePath = ModalRoute.of(context)!.settings.arguments as String;
    final controller = context.read<SimpleCsvFileController>();
    final futureCsvFile = controller.loadCsvFile(csvFilePath);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: FutureBuilder(
          future: futureCsvFile,
          builder: _titleBuilder,
        ),
      ),
      body: FutureBuilder(builder: _bodyBuilder, future: futureCsvFile),
    );
  }

  Widget _bodyBuilder(BuildContext context, AsyncSnapshot<void> snapshot) {
    final controller = context.read<SimpleCsvFileController>();

    switch (controller.status) {
      case CsvFileLoadStatus.loading:
        return Center(
            child: CircularProgressIndicator(
          color: Theme.of(context).secondaryHeaderColor,
        ));

      case CsvFileLoadStatus.success:
        return const CsvDataTable();

      case CsvFileLoadStatus.fail:
        return Container(
          child: const Center(
            child: Text('Fail'),
          ),
          color: const Color(0xFF8EDC91),
        );

      case CsvFileLoadStatus.idle:
        return Container(
            color: const Color(0xFF8EDC91),
            child: const Center(
              child: Text('Idle'),
            ));
    }
  }

  Widget _titleBuilder(BuildContext context, AsyncSnapshot<void> snapshot) {
    final controller = context.read<SimpleCsvFileController>();
    const csvReaderText = Text('CSV Reader');
    switch (controller.status) {
      case CsvFileLoadStatus.success:
        return controller.fileName == null
            ? csvReaderText
            : Text(controller.fileName!);

      default:
        return csvReaderText;
    }
  }
}
