import 'package:flutter/material.dart';
import 'package:run_app/components/menu_button.dart';
import 'package:run_app/screens/pace_screen.dart';
import 'package:run_app/screens/progression_screen.dart';
import 'package:run_app/screens/running_pace_screen.dart';
import 'package:run_app/screens/track_screen.dart';

class MenuScreen extends StatefulWidget {
  static String id = "menu_screen";
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuButton(buttonText: "Pace", destination: PaceScreen.id),
            MenuButton(
                buttonText: "Progression calculator",
                destination: ProgressionScreen.id),
            MenuButton(
                buttonText: "Track calculator", destination: TrackScreen.id),
            MenuButton(
                buttonText: "Multi calculator",
                destination: RunningPaceScreen.id),
          ],
        ),
      ),
    )));
  }
}
