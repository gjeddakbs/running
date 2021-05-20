import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:run_app/constants.dart';

class PaceWidget extends StatefulWidget {
  final double speed;
  final metric;
  final Function valueChangeFunction;
  final Function cupertinoUpdate;
  final Function sliderUpdate;
  PaceWidget(
      {required this.speed,
      required this.metric,
      required this.valueChangeFunction,
      required this.cupertinoUpdate,
      required this.sliderUpdate});

  @override
  _PaceWidgetState createState() => _PaceWidgetState();
}

class _PaceWidgetState extends State<PaceWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.metric.toString() == "SpeedMetric.kmHour" ||
        widget.metric.toString() == "SpeedMetric.milesHour") {
      return Column(
        children: [
          Text(
            "${widget.speed.toStringAsFixed(1)} ${(widget.metric.toString() == "SpeedMetric.kmHour") ? "km/h" : "mph"}",
            style: kNumberTextStyle,
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
                thumbColor: Color(0xFFEB1555),
                activeTrackColor: Colors.white,
                inactiveTrackColor: Color(0xFF8D8E98),
                overlayColor: Color(0x29EB1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
            child: Container(
              width: double.infinity,
              child: Slider(
                  min: 0.0,
                  max: 100.0,
                  divisions: 500,
                  // label: length.toStringAsFixed(1),
                  value: widget.speed,
                  onChanged: (value) {
                    setState(() {
                      widget.sliderUpdate(value);
                      // speedSliderChange(value);
                      // speed = value.toDouble();

                      widget.valueChangeFunction();
                    });
                  }),
            ),
          ),
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 80,
          child: CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.ms,
              onTimerDurationChanged: (value) {
                setState(() {
                  widget.cupertinoUpdate(value.inSeconds);
                  // speedCupertinoChange(value.inSeconds);
                  // secondsUsed = value.inSeconds;
                  widget.valueChangeFunction();
                });
              }),
        ),
      );
    }
  }
}
