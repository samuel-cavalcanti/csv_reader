import 'package:csv_reader/core/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSV Reader',
      // themeMode: ThemeMode.dark,
      theme: ThemeData(primaryColor: Color(0xff1b5e20)),
      debugShowCheckedModeBanner: false,
      home: Routes.buildSplashPage(),
      routes: Routes.buildRoutes(),
    );
  }
}
