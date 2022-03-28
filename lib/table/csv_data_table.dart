import 'package:csv_reader/table/simple_csv_file_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CsvDataTable extends StatelessWidget {
  const CsvDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SimpleCsvFileController>();

    return InteractiveViewer(
        constrained: false,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: controller.headers!
                .map((header) => DataColumn(label: Text(header)))
                .toList(),
            rows: tableToDataRows(controller.table!),
          ),
        ));
  }

  List<DataRow> tableToDataRows(List<List<String>> table) {
    return table.map((line) => DataRow(cells: _lineToDataCells(line))).toList();
  }

  List<DataCell> _lineToDataCells(List<String> line) {
    return line.map((text) => _textToDataCell(text)).toList();
  }

  DataCell _textToDataCell(String text) {
    return DataCell(Center(
      child: Text(text),
    ));
  }
}
