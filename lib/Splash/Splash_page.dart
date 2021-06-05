import 'package:csv_reader/Splash/StartIntentController.dart';
import 'package:csv_reader/core/FilePathProviderController.dart';
import 'package:csv_reader/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    final StartIntentController controller =
        context.read<StartIntentController>();

    controller.addListener(() {
      switch (controller.status) {
        case FilePathProviderControllerStatus.idle:
          Navigator.of(context).pushReplacementNamed(Routes.home);
          return;
        case FilePathProviderControllerStatus.picking:
          return;

        case FilePathProviderControllerStatus.picked:
          Navigator.of(context).pushReplacementNamed(Routes.table,
              arguments: controller.filePath);
          return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: Theme.of(context).secondaryHeaderColor,
      )),
    );
  }
}
