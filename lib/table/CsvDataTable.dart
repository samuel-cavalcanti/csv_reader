import 'package:csv_reader/core/CsvFileController.dart';
import 'package:csv_reader/table/SimpleCsvFileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CsvDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CsvFileController controller =
        context.watch<SimpleCsvFileController>();

    if (controller.status == CsvFileLoadStatus.loading)
      return Center(
          child: CircularProgressIndicator(
        color: Theme.of(context).secondaryHeaderColor,
      ));

    if (controller.status == CsvFileLoadStatus.success)
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

    return Container(
      color: Color(0xFF8EDC91),
    );
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
