import 'package:flutter/material.dart';
import 'package:run_app/screens/menu_screen.dart';
import 'package:run_app/screens/pace_screen.dart';
import 'package:run_app/screens/progression_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(),
      initialRoute: MenuScreen.id,
      routes: <String, WidgetBuilder>{
        MenuScreen.id: (BuildContext context) => MenuScreen(),
        PaceScreen.id: (BuildContext context) => PaceScreen(),
        ProgressionScreen.id: (BuildContext context) => ProgressionScreen(),
      },
    );
  }
}
