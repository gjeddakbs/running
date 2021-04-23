import 'package:flutter/material.dart';
import 'package:run_app/screens/pace_time_distance_screen.dart';
import 'package:run_app/screens/progression_screen.dart';
import 'package:run_app/screens/track_screen.dart';

class RunningPaceScreen extends StatefulWidget {
  static String id = "running_pace_screen";
  @override
  _RunningPaceScreenState createState() => _RunningPaceScreenState();
}

class _RunningPaceScreenState extends State<RunningPaceScreen> {
  int _selectedIndex = 0;

  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    MultiCalc(),
    TrackScreen(),
    ProgressionScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.speed_outlined),
            label: "Pace",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_outlined),
            label: 'Track',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart_outlined),
            label: 'Progress',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
