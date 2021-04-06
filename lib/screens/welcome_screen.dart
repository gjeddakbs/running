import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:run_app/functions/sport.dart';

var secondsUsed = 0;

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    secondsUsed = 0;
    super.initState();
  }

  bool metric = true;
  var speed = 1.0;
  List<bool> _selections = [true, false];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Units",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: ToggleButtons(
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Pace",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Container(
                height: 100,
                width: 250,
                child: CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.ms,
                    onTimerDurationChanged: (value) {
                      setState(() {
                        secondsUsed = value.inSeconds;

                        speed = meterSecondConverter(
                          metric: _selections[0],
                          seconds: secondsUsed,
                        );
                        print(secondsUsed);
                        print(speed);
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${speed.toStringAsFixed(2)} meter/s"),
            ),
            _selections[0]
                ? Text(
                    "Converted to miles: \n ${kmMintoMileMin(seconds: secondsUsed)} min/mile",
                    textAlign: TextAlign.center,
                  )
                : Text(
                    "Converted to kilometers: \n ${mpMinToKmMin(seconds: secondsUsed)} min/km",
                    textAlign: TextAlign.center,
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Time to finish",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Text("1 km: ${timeUsed(pace: speed, length: 1001)}"),
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
