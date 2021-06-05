import 'package:csv_reader/Splash/AndroidIntent.dart';
import 'package:csv_reader/Splash/Splash_page.dart';
import 'package:csv_reader/Splash/StartIntentController.dart';
import 'package:csv_reader/home/CsvFilePathPickerController.dart';
import 'package:csv_reader/home/CsvFilePicker.dart';
import 'package:csv_reader/home/home_page.dart';
import 'package:csv_reader/table/SimpleCsvFileController.dart';
import 'package:csv_reader/table/table_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Routes {
  static const table = '/table';
  static const home = '/home';
  static const splash = '/splash';

  static Map<String, WidgetBuilder> buildRoutes() {
    return <String, WidgetBuilder>{
      Routes.table: (BuildContext context) => buildTablePage(),
      Routes.home: (BuildContext context) => Routes.buildHomePage(),
      Routes.splash: (BuildContext context) => Routes.buildSplashPage()
    };
  }

  static Widget buildHomePage() {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          CsvFilePathPickerController(CsvFilePicker()),
      child: HomePage(),
    );
  }

  static Widget buildSplashPage() {
    return ChangeNotifierProvider(
      create: (BuildContext context) => StartIntentController(AndroidIntent()),

      child: SplashPage(),
    );
  }

  static Widget buildTablePage() {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SimpleCsvFileController(),
      child: TablePage(),
    );
  }
}
