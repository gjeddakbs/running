import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:run_app/constants.dart';
import 'package:run_app/functions/track_functions.dart';

class TrackScreen extends StatefulWidget {
  static String id = "track_screen";

  @override
  _TrackScreenState createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  num length = 0;
  var timeInputSeconds = 0;
  bool results = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    length = num.parse(value);
                  }
                },
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Length",
                ),
              )),
              Text(
                "Time",
                style: kNumberTextStyle,
              ),
              Container(
                height: 150,
                child: CupertinoTimerPicker(onTimerDurationChanged: (value) {
                  setState(() {
                    timeInputSeconds = value.inSeconds;
                    // onChangeFunction();
                  });
                }),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    results = true;
                  });
                  FocusScope.of(context).unfocus();
                },
                child: Text("Submit"),
              ),
              results
                  ? Column(children: [
                      Text(
                          "${numberOfRounds(length: length).toString()} rounds"),
                    ])
                  : Text(""),
            ],
          ),
        ),
      ),
    );
  }
}
