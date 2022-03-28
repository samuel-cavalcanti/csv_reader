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

    final title = controller.fileName ?? 'CSV Reader';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: FutureBuilder(
          builder: _builder, future: controller.loadCsvFile(csvFilePath)),
    );
  }

  Widget _builder(BuildContext context, AsyncSnapshot<void> snapshot) {
    final controller = context.read<SimpleCsvFileController>();

    switch (controller.status) {
      case CsvFileLoadStatus.loading:
        return Center(
            child: CircularProgressIndicator(
          color: Theme.of(context).secondaryHeaderColor,
        ));

      case CsvFileLoadStatus.success:
        return ls
        const CsvDataTable();

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
}
