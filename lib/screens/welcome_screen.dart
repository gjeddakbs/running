import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:run_app/functions/sport.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  var verdi;
  bool metric = true;
  var speed = 1.0;
  List<bool> _selections = List.generate(2, (_) => false);
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
              children: [
                Text("km"),
                Text("mp"),
              ],
              isSelected: _selections,
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < _selections.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      _selections[buttonIndex] = true;
                    } else {
                      _selections[buttonIndex] = false;
                    }
                  }
                });
              },
            ),
            CupertinoTimerPicker(
                mode: CupertinoTimerPickerMode.ms,
                onTimerDurationChanged: (value) {
                  setState(() {
                    verdi = value.inSeconds;
                    if (verdi != null) {
                      speed = meterSecondConverter(
                        metric: _selections[0],
                        seconds: verdi,
                      );
                      print("dsdsa");
                    }
                  });
                }),
            Text("${speed.toStringAsFixed(2)} m/s"),
            _selections[0]
                ? Text("Imperial: ${kmMintoMileMin(seconds: verdi)} min/mp")
                : Text("Metric: ${mpMinToKmMin(seconds: verdi)} min/km"),
            Text("1 km: ${timeUsed(pace: speed, length: 1000)}"),
            Text("1.5km: ${timeUsed(pace: speed, length: 1500)}"),
            Text("1 mile: ${timeUsed(pace: speed, length: 1609)}"),
            Text("3 km: ${timeUsed(pace: speed, length: 3000)}"),
            Text("5 km: ${timeUsed(pace: speed, length: 5000)}"),
            Text("10 km: ${timeUsed(pace: speed, length: 10000)}"),
            Text("Half-marathon: ${timeUsed(pace: speed, length: 21097)}"),
            Text("Marathon: ${timeUsed(pace: speed, length: 42195)}"),
          ],
        ),
      ),
    );
  }
}
