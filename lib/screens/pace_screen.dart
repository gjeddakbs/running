import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:run_app/functions/sport.dart';

var secondsUsed = 0;

class PaceScreen extends StatefulWidget {
  static String id = "pace_screen";

  @override
  _PaceScreenState createState() => _PaceScreenState();
}

class _PaceScreenState extends State<PaceScreen> {
  Duration manual = Duration(seconds: 50);
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        speed = meterSecondConverter(
                            metric: _selections[0], seconds: secondsUsed);
                        _selections[buttonIndex] = true;
                      } else {
                        speed = meterSecondConverter(
                            metric: _selections[0], seconds: secondsUsed);
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
              child: Row(
                children: [
                  Container(
                    // height: 50,
                    width: 250,
                    child: CupertinoTimerPicker(
                        // key: UniqueKey(),
                        initialTimerDuration: manual,
                        mode: CupertinoTimerPickerMode.ms,
                        onTimerDurationChanged: (value) {
                          setState(() {
                            secondsUsed = value.inSeconds;

                            speed = meterSecondConverter(
                              metric: _selections[0],
                              seconds: secondsUsed,
                            );
                          });
                        }),
                  )
                ],
              ),
            ),
            Text("Speed"),
            TextButton(
                onPressed: () {
                  setState(() {
                    manual = Duration(seconds: 20);
                  });
                },
                child: Text("dsadsa")),
            // FloatingActionButton(onPressed: () {
            //   setState(() {
            //     manual = Duration(seconds: 50);
            //     pacePicker(Duration(seconds: 20));
            //     // didUpdateWidget(oldWidget);
            //
            //     print(manual);
            //   });
            // }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${speed.toStringAsFixed(2)} meter/s"),
            ),
            _selections[0]
                ? Text(
                    "Mile pace: \n ${kmMintoMileMin(seconds: secondsUsed)} min/mile",
                    textAlign: TextAlign.center,
                  )
                : Text(
                    "Km pace: \n ${mpMinToKmMin(seconds: secondsUsed)} min/km",
                    textAlign: TextAlign.center,
                  ),
            Text("Per hour"),
            Text("${kmPerHourConverter(pace: speed).toStringAsFixed(2)} km/h"),
            Text(
                "${milesPerHourConverter(pace: speed).toStringAsFixed(2)} miles/h"),
            DistanceBox(speed: speed),
          ],
        ),
      ),
    );
  }

//   Container pacePicker(Duration time) {
//     return Container(
//       height: 100,
//       width: 250,
//       child: CupertinoTimerPicker(
//           key: UniqueKey(),
//           initialTimerDuration: time,
//           mode: CupertinoTimerPickerMode.ms,
//           onTimerDurationChanged: (value) {
//             setState(() {
//               secondsUsed = value.inSeconds;
//
//               speed = meterSecondConverter(
//                 metric: _selections[0],
//                 seconds: secondsUsed,
//               );
//             });
//           }),
//     );
//   }
// }
}

class DistanceBox extends StatelessWidget {
  const DistanceBox({Key? key, required this.speed}) : super(key: key);

  final double speed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Time to finish",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("400m: ${timeUsed(pace: speed, length: 400)}"),
                    Text("800m: ${timeUsed(pace: speed, length: 400)}"),
                    Text("1 km: ${timeUsed(pace: speed, length: 1001)}"),
                    Text("1.5km: ${timeUsed(pace: speed, length: 1500)}"),
                    Text("1 mile: ${timeUsed(pace: speed, length: 1609)}"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("3 km: ${timeUsed(pace: speed, length: 3000)}"),
                    Text("5 km: ${timeUsed(pace: speed, length: 5000)}"),
                    Text("10 km: ${timeUsed(pace: speed, length: 10000)}"),
                    Text(
                        "Half-marathon: ${timeUsed(pace: speed, length: 21097)}"),
                    Text("Marathon: ${timeUsed(pace: speed, length: 42195)}"),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
