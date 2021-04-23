import 'package:flutter/material.dart';
import "package:run_app/functions/progressionfunct.dart";

class ProgressionScreen extends StatefulWidget {
  static String id = "progression_screen";

  @override
  _ProgressionScreenState createState() => _ProgressionScreenState();
}

class _ProgressionScreenState extends State<ProgressionScreen> {
  double currentMileage = 0.0;
  double mileageGoal = 0.0;
  bool results = false;
  List<double> resultList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                currentMileage = double.parse(value);
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Current weekly mileage",
              ),
            )),
            Flexible(
                child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                mileageGoal = double.parse(value);
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "weekly mileage goal",
              ),
            )),
            TextButton(
                onPressed: () {
                  setState(() {
                    resultList = progression(
                        currentMileage: currentMileage,
                        mileageGoal: mileageGoal);
                    results = true;
                  });
                  FocusScope.of(context).unfocus();
                },
                child: Text("Submit")),
            results
                ? Expanded(
                    child: ListView.builder(
                        itemCount: resultList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Center(
                                child: Text(
                                    "Week ${index + 1}: ${resultList[index].toStringAsFixed(1)}")),
                          );
                        }),
                  )
                : Text(""),
          ],
        ),
      ),
    );
  }
}
