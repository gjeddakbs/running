import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:run_app/functions/sport.dart';

double lengthInput = 0;
double lengthResult = 0;

class MultiCalc extends StatefulWidget {
  @override
  _MultiCalcState createState() => _MultiCalcState();
}

class _MultiCalcState extends State<MultiCalc> {
  int hoursPassed = 0;
  int minutesPassed = 0;
  int secondsPassed = 0;
  int paceHourInput = 0;

  int paceMinutesInput = 0;
  int paceSecondsInput = 0;
  int paceSecondsResult = 0;
  int paceMinutesResult = 0;
  int paceHoursResult = 0;
  int hourInput = 0;
  int minutesInput = 0;
  int secondsInput = 0;

  List<String> distance = [
    "km",
    "miles",
    "meters",
  ];
  String dropDownValue = "km";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Time to finish"),
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    key: UniqueKey(),
                    initialValue: hoursPassed.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      hourInput = int.parse(value);
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Hours",
                    ),
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    key: UniqueKey(),
                    initialValue: minutesPassed.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      minutesInput = int.parse(value);
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Minutes",
                    ),
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    key: UniqueKey(),
                    initialValue: secondsPassed.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      secondsInput = int.parse(value);
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Seconds",
                    ),
                  ),
                ),
              ],
            ),
            Text("Length"),
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    key: UniqueKey(),
                    keyboardType: TextInputType.number,
                    initialValue: lengthResult.toString(),
                    onChanged: (value) {
                      lengthInput = double.parse(value);
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Length",
                    ),
                  ),
                ),
                // Flexible(
                //   child: DropdownButton(
                //     // key: ValueKey(dropDownValue),
                //     // isDense: true,
                //     value: dropDownValue,
                //     onChanged: (String? newValue) {
                //       setState(() {
                //         dropDownValue = newValue!;
                //       });
                //     },
                //     items:
                //         distance.map<DropdownMenuItem<String>>((String value) {
                //       return DropdownMenuItem<String>(
                //         value: value,
                //         child: Text(value),
                //       );
                //     }).toList(),
                //   ),
                // ),
              ],
            ),
            Text("Pace (time elapsed per kilometer)"),
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    key: UniqueKey(),
                    initialValue: paceHoursResult != 0
                        ? paceHoursResult.toString()
                        : null,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      paceHourInput = int.parse(value);
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "hour",
                    ),
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    key: UniqueKey(),
                    keyboardType: TextInputType.number,
                    initialValue: paceMinutesResult.toString(),
                    onChanged: (value) {
                      paceMinutesInput = int.parse(value);
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "minutes",
                    ),
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    key: UniqueKey(),
                    keyboardType: TextInputType.number,
                    initialValue: paceSecondsResult.toString(),
                    onChanged: (value) {
                      paceSecondsInput = int.parse(value);
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "seconds",
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(),
            TextButton(
                onPressed: () {
                  print((3000 / 60).floor());
                  setState(() {
                    // if (lengthInput == 0.0 && lengthResult == 0.0) {
                    //   print("Lengdekalkulering trigga");
                    //   lengthResult =
                    //       (secondsSum(hourInput, minutesInput, secondsInput)) *
                    //           meterSecondConverter(
                    //               metric: true,
                    //               seconds: secondsSum(paceHourInput,
                    //                   paceMinutesInput, paceSecondsInput));
                    // }
                    print(hourInput);
                    print(minutesInput);
                    print(secondsInput);
                    if (hourInput == 0 &&
                        minutesInput == 0 &&
                        secondsInput == 0) {
                      print("tidskalkulering trigga");
                      double result = lengthInput /
                          meterSecondConverter(
                              metric: true,
                              seconds: secondsSum(paceHourInput,
                                  paceMinutesInput, paceSecondsInput));
                      print(result);
                      var hourResult = (result / 3600).floor();
                      hoursPassed = hourResult;
                      result -= hourResult;

                      var minuteResult = (result / 60).floor();
                      print("minuteResult:  $minuteResult");
                      minutesPassed = minuteResult;
                      result -= minuteResult;
                      var secondResults = result;
                      print("secondresults: $secondResults");
                      secondsPassed = secondResults.toInt();
                    }
                  });
                },
                child: Text("Press meg "))
          ],
        ),
      ),
    );
  }
}

int updateTest() {
  return 10;
}

int secondsSum(int hours, int minutes, int seconds) {
  return ((hours * 3600) + (minutes * 60) + seconds);
}
