import 'package:flutter/material.dart';

double currentSliderValue = 20;

class MultiCalc extends StatefulWidget {
  @override
  _MultiCalcState createState() => _MultiCalcState();
}

class _MultiCalcState extends State<MultiCalc> {
  List<String> distance = ["km", "miles", "Half-marathon", "Marathon"];
  String dropDownValue = "km";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    currentSliderValue = double.parse(value);
                  });
                }
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: currentSliderValue.toString(),
                hintText: currentSliderValue.toString(),
              ),
            )),
            Center(child: Text(currentSliderValue.toStringAsFixed(1))),
            Row(
              children: [
                Expanded(
                  child: Slider(
                      min: 0,
                      max: 200.0,
                      value: currentSliderValue,
                      label: currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          currentSliderValue = value;
                        });
                      }),
                ),
                DropdownButton(
                  isDense: true,
                  value: dropDownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue = newValue!;
                    });
                    distanceUpdater(inputMetrics: dropDownValue);
                  },
                  items: distance.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

void distanceUpdater({required String inputMetrics}) {
  if (inputMetrics == "Half-marathon") {
    currentSliderValue = 21.0975;
  } else if (inputMetrics == "Marathon") {
    currentSliderValue = 42.195;
  }
}
