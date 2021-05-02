import 'package:flutter/material.dart';
import 'package:run_app/screens/menu_screen.dart';
import 'package:run_app/screens/pace_screen.dart';
import 'package:run_app/screens/progression_screen.dart';
import 'package:run_app/screens/running_pace_screen.dart';
import 'package:run_app/screens/track_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0D21),
        scaffoldBackgroundColor: const Color(0xFF0A0D21),
      ),
      home: MenuScreen(),
      initialRoute: MenuScreen.id,
      routes: <String, WidgetBuilder>{
        MenuScreen.id: (BuildContext context) => MenuScreen(),
        PaceScreen.id: (BuildContext context) => PaceScreen(),
        ProgressionScreen.id: (BuildContext context) => ProgressionScreen(),
        TrackScreen.id: (BuildContext context) => TrackScreen(),
        RunningPaceScreen.id: (BuildContext context) => RunningPaceScreen(),
      },
    );
  }
}
