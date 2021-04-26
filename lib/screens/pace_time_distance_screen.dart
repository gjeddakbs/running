import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            Text("Time"),
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
                      secondsInput = int.parse(value);
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
            Text("Pace"),
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
            TextButton(
                onPressed: () {
                  setState(() {
                    hoursPassed = 50;
                    // paceHoursResult = updateTest();
                    paceHoursResult = 30;
                  });
                  print(paceHoursResult.toString());
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
