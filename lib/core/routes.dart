import 'package:csv_reader/Splash/android_intent.dart';
import 'package:csv_reader/Splash/splash_page.dart';
import 'package:csv_reader/Splash/start_intent_controller.dart';
import 'package:csv_reader/home/csv_file_path_picker_controller.dart';
import 'package:csv_reader/home/csv_file_picker.dart';
import 'package:csv_reader/home/home_page.dart';
import 'package:csv_reader/table/simple_csv_file_controller.dart';
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
      child: const HomePage(),
    );
  }

  static Widget buildSplashPage() {
    return ChangeNotifierProvider(
      create: (BuildContext context) => StartIntentController(AndroidIntent()),
      child: const SplashPage(),
    );
  }

  static Widget buildTablePage() {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SimpleCsvFileController(),
      child: const TablePage(),
    );
  }
}
