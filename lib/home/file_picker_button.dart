import 'package:csv_reader/home/csv_file_path_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/file_path_provider_controller.dart';

class FilePickerButton extends StatelessWidget {
  const FilePickerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CsvFilePathPickerController>();

    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => Theme.of(context).primaryColor)),
      onPressed: controller.status == FilePathProviderControllerStatus.picking
          ? null
          : controller.callProvider,
      child: const Text(
        'Selecione um arquivo CSV',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
