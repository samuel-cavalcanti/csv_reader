import 'package:csv_reader/core/routes.dart';
import 'package:csv_reader/home/FilePickerButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CsvFilePathPickerController.dart';
import '../core/FilePathProviderController.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    final CsvFilePathPickerController controller = context.read();

    controller.addListener(() {
      if (controller.status == FilePathProviderControllerStatus.picked)
        Navigator.of(context)
            .pushReplacementNamed(Routes.table, arguments: controller.filePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'CSV Reader',
                style: TextStyle(fontSize: 24),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: FilePickerButton(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
