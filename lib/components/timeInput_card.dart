import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:run_app/constants.dart';

class TimeWidget extends StatelessWidget {
  TimeWidget(
      {required this.onChangeFunction, required this.timeUpdateFunction});

  final Function onChangeFunction;
  final Function timeUpdateFunction;

  @override
  Widget build(BuildContext context) {
    {
      return Column(
        children: [
          Text(
            "Time",
            style: kNumberTextStyle,
          ),
          Container(
            height: 150,
            child: CupertinoTimerPicker(onTimerDurationChanged: (value) {
              timeUpdateFunction(value.inSeconds);
              onChangeFunction();
            }),
          )
        ],
      );
    }
  }
}
