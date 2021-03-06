import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:run_app/components/calculation_card.dart';
import 'package:run_app/components/icon_content.dart';
import 'package:run_app/components/metricLabel_content.dart';
import 'package:run_app/components/pacewidget_card.dart';
import 'package:run_app/components/resultContainer.dart';
import 'package:run_app/components/timeInput_card.dart';
import 'package:run_app/constants.dart';
import 'package:run_app/functions/sport.dart';

enum CalculationType { pace, distance, time }
enum SpeedMetric { milesMin, kmMin, kmHour, milesHour }
enum LengthMetric { meters, km, miles }

var secondsUsed = 0;
var timeInputSeconds = 0;
double length = 0;
double speed = 0.0;
double meterSecond = 0;
String timeResult = "00:00:00";
String paceResult = "00h 00m 00s";
String distanceResult = "10km";

class PaceTimeDistance extends StatefulWidget {
  @override
  _PaceTimeDistanceState createState() => _PaceTimeDistanceState();
}

final nameHolder = TextEditingController();

clearTextInput() {
  nameHolder.clear();
}

CalculationType selectedCalculation = CalculationType.pace;
SpeedMetric selectedSpeed = SpeedMetric.kmMin;
LengthMetric selectedLength = LengthMetric.meters;

class _PaceTimeDistanceState extends State<PaceTimeDistance> {
  void timeCalcLive() {
    if (length > 0 && secondsUsed > 0 || speed > 0) {
      setState(() {
        timeResult = timeUsed(
            pace: meterSecondConverter2(
                speedMetric: selectedSpeed, seconds: secondsUsed, value: speed),
            length:
                lengthToMeter(lengthMetric: selectedLength, length: length));
      });
    }
  }

  void paceCalcLive() {
    print("pacecalclive  called");
    if (length > 0.0) {
      setState(() {
        var paceInput = velocity(
            time: timeInputSeconds,
            distance:
                lengthToMeter(lengthMetric: selectedLength, length: length));
        paceResult = meterSecondToDifferentSpeeds(
            meterSecondSpeed: paceInput, speedEnum: selectedSpeed);
      });
    }
  }

  void distanceCalcLive() {
    setState(() {
      print("tid endret. Distancecalc called");
      distanceResult = distance(
              paceMS: meterSecondConverter2(
                  speedMetric: selectedSpeed,
                  seconds: secondsUsed,
                  value: speed),
              timeUsed: timeInputSeconds,
              lengthMetric: selectedLength)
          .toString();
    });
  }

  void speedSliderChange(double speedInputValue) {
    setState(() {
      speed = speedInputValue;
      print(speedInputValue);
    });
  }

  void speedCupertinoChange(int secondsInputValue) {
    setState(() {
      secondsUsed = secondsInputValue;
      print(secondsInputValue);
    });
  }

  void timeCupertinoChange(int timeUsedInputValue) {
    setState(() {
      timeInputSeconds = timeUsedInputValue;
    });
  }

  // Widget paceWidget({ required double speed, required metric, required Function valueChangeFunction, required Function cupertinoUpdate, required Function sliderUpdate}) {
  //   if (metric == SpeedMetric.kmHour || metric == SpeedMetric.milesHour) {
  //     return Column(
  //       children: [
  //         Text(
  //           "${speed.toStringAsFixed(1)} ${(metric == SpeedMetric.kmHour) ? "km/h" : "mph"}",
  //           style: kNumberTextStyle,
  //         ),
  //         SliderTheme(
  //           data: SliderTheme.of(context).copyWith(
  //               thumbColor: Color(0xFFEB1555),
  //               activeTrackColor: Colors.white,
  //               inactiveTrackColor: Color(0xFF8D8E98),
  //               overlayColor: Color(0x29EB1555),
  //               thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
  //               overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
  //           child: Container(
  //             width: double.infinity,
  //             child: Slider(
  //                 min: 0.0,
  //                 max: 100.0,
  //                 divisions: 500,
  //                 // label: length.toStringAsFixed(1),
  //                 value: speed,
  //                 onChanged: (value) {
  //                   setState(() {
  //                     sliderUpdate(value);
  //                     // speedSliderChange(value);
  //                     // speed = value.toDouble();
  //
  //                     valueChangeFunction();
  //                   });
  //                 }),
  //           ),
  //         ),
  //       ],
  //     );
  //   } else {
  //     return Padding(
  //       padding: const EdgeInsets.all(20.0),
  //       child: Container(
  //         height: 80,
  //         child: CupertinoTimerPicker(
  //             mode: CupertinoTimerPickerMode.ms,
  //             onTimerDurationChanged: (value) {
  //               setState(() {
  //                 cupertinoUpdate(value.inSeconds);
  //                 // speedCupertinoChange(value.inSeconds);
  //                 // secondsUsed = value.inSeconds;
  //                 valueChangeFunction();
  //               });
  //             }),
  //       ),
  //     );
  //   }
  // }

  Widget testFunction({required selectedValue}) {
    /**TIME*/
    if (selectedValue == CalculationType.time) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: kBoxDeco,
            child: paceInput(onTapFunction: timeCalcLive),
          ),
          Container(
              decoration: kBoxDeco,
              child: lengthInput(onTapFunction: timeCalcLive)),
          Flexible(
            child: ResultContainer(
              resultText: "Time elapsed:",
              result: timeResult,
            ),
            // child: Text(
            //   "Time used:\n $timeResult",
            //   style: kLargeButtonTextStyle,
            // ),
          ),
          // Flexible(
          //   child: BottomButton(
          //       onTap: () {
          //         setState(() {
          //           timeResult = timeUsed(
          //               pace: meterSecondConverter2(
          //                   speedMetric: selectedSpeed,
          //                   seconds: secondsUsed,
          //                   value: speed),
          //               length: lengthToMeter(
          //                   lengthMetric: selectedLength, length: length));
          //         });
          //       },
          //       buttonTitle: "Calculate"),
          // ),
        ],
      );
      /**DISTANCE */
    } else if (selectedValue == CalculationType.distance) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: paceInput(onTapFunction: distanceCalcLive),
            decoration: kBoxDeco,
          ),
          Container(
              decoration: kBoxDeco,
              child: TimeWidget(
                // onChangeFunction: paceCalcLive,
                onChangeFunction: distanceCalcLive,
                timeUpdateFunction: timeCupertinoChange,
              )),
          lengthMetricRow(onTapFunction: distanceCalcLive),
          Flexible(
            child: ResultContainer(
              resultText: "Distance:",
              result: distanceResult,
            ),
            // child: Text(
            //   "Distance ran:\n $distanceResult",
            //   style: kLargeButtonTextStyle,
            // ),
          ),
          // Flexible(
          //   child: BottomButton(
          //       onTap: distanceCalcLive, buttonTitle: "Calculate distance"),
          // )
        ],
      );
    }
    /**PACE*/
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              decoration: kBoxDeco,
              child: TimeWidget(
                onChangeFunction: paceCalcLive,
                timeUpdateFunction: timeCupertinoChange,
              )),
          Container(
              decoration: kBoxDeco,
              child: lengthInput(onTapFunction: paceCalcLive)),
          speedCardRow(onTapFunction: paceCalcLive),
          Flexible(
              child: ResultContainer(resultText: "Pace:", result: paceResult)
              // child: Text(
              //   "Running pace:\n $paceResult",
              //   style: kLargeButtonTextStyle,
              // ),
              ),
          // Flexible(
          //     child: BottomButton(
          //         onTap: paceCalcLive, buttonTitle: "Calculate pace"))
        ]);
  }

  Column lengthInput({required Function onTapFunction}) {
    return Column(
      children: [
        Text(
          "Length",
          style: kNumberTextStyle,
        ),
        lengthMetricRow(onTapFunction: onTapFunction),
        Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 52.0),
            child: TextFormField(
              controller: nameHolder,
              onTap: () => clearTextInput(),
              // initialValue: length.toString(),
              style: kNumberTextStyle,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) {
                    length = double.parse(value);
                    // timeCalcLive();
                    // paceCalcLive();
                    onTapFunction();
                  }
                });
              },
            ),
          ),
        ]),
      ],
    );
  }

  Row lengthMetricRow({required Function onTapFunction}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CalculationCard(
            colour: selectedLength == LengthMetric.meters
                ? kActiveCardColor
                : kInactiveCardColour,
            cardChild: MetricLabelContent(
              labelText: "meters",
            ),
            onPress: () {
              setState(() {
                selectedLength = LengthMetric.meters;
                onTapFunction();
              });
            }),
        CalculationCard(
            colour: selectedLength == LengthMetric.km
                ? kActiveCardColor
                : kInactiveCardColour,
            cardChild: MetricLabelContent(
              labelText: "km",
            ),
            onPress: () {
              setState(() {
                selectedLength = LengthMetric.km;
                onTapFunction();
              });
            }),
        CalculationCard(
            colour: selectedLength == LengthMetric.miles
                ? kActiveCardColor
                : kInactiveCardColour,
            cardChild: MetricLabelContent(
              labelText: "miles",
            ),
            onPress: () {
              setState(() {
                selectedLength = LengthMetric.miles;
                onTapFunction();
              });
            }),
      ],
    );
  }

  Column paceInput({required Function onTapFunction}) {
    return Column(
      children: [
        Text(
          "Pace",
          style: kNumberTextStyle,
        ),
        speedCardRow(onTapFunction: onTapFunction),
        PaceWidget(
            speed: speed,
            metric: selectedSpeed,
            valueChangeFunction: onTapFunction,
            cupertinoUpdate: speedCupertinoChange,
            sliderUpdate: speedSliderChange)
      ],
    );
  }

  Row speedCardRow({required Function onTapFunction}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CalculationCard(
            colour: selectedSpeed == SpeedMetric.kmMin
                ? kActiveCardColor
                : kInactiveCardColour,
            cardChild: MetricLabelContent(labelText: "min/km"),
            onPress: () {
              setState(() {
                selectedSpeed = SpeedMetric.kmMin;
                onTapFunction();
              });
            }),
        CalculationCard(
            colour: selectedSpeed == SpeedMetric.kmHour
                ? kActiveCardColor
                : kInactiveCardColour,
            cardChild: MetricLabelContent(labelText: "km/h"),
            onPress: () {
              setState(() {
                selectedSpeed = SpeedMetric.kmHour;
                onTapFunction();
              });
            }),
        CalculationCard(
            colour: selectedSpeed == SpeedMetric.milesMin
                ? kActiveCardColor
                : kInactiveCardColour,
            cardChild: MetricLabelContent(labelText: "min/miles"),
            onPress: () {
              setState(() {
                selectedSpeed = SpeedMetric.milesMin;
                onTapFunction();
              });
            }),
        CalculationCard(
            colour: selectedSpeed == SpeedMetric.milesHour
                ? kActiveCardColor
                : kInactiveCardColour,
            cardChild: MetricLabelContent(labelText: "mph"),
            onPress: () {
              setState(() {
                selectedSpeed = SpeedMetric.milesHour;
                onTapFunction();
              });
            })
      ],
    );
  }

  // Column timeInput({required Function onChangeFunction}) {
  //   return Column(
  //     children: [
  //       Text(
  //         "Time",
  //         style: kNumberTextStyle,
  //       ),
  //       Container(
  //         height: 150,
  //         child: CupertinoTimerPicker(onTimerDurationChanged: (value) {
  //           setState(() {
  //             timeInputSeconds = value.inSeconds;
  //             onChangeFunction();
  //           });
  //         }),
  //       )
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /**SELECTION ROW*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /**PACE CARD*/
                CalculationCard(
                    colour: selectedCalculation == CalculationType.pace
                        ? kActiveCardColor
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      labelText: 'PACE',
                      icon: Icons.speed_outlined,
                      color: selectedCalculation == CalculationType.pace
                          ? kActiveTextColor
                          : kInactiveTextColor,
                      labelStyle: selectedCalculation == CalculationType.pace
                          ? kActiveLabelTextStyle
                          : kInactiveLabelTextStyle,
                    ),
                    onPress: () {
                      print("pace printed");
                      setState(() {
                        selectedCalculation = CalculationType.pace;
                      });
                      print(selectedCalculation);
                    }),
                /**TIME CARD */
                CalculationCard(
                    colour: selectedCalculation == CalculationType.time
                        ? kActiveCardColor
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      labelText: 'TIME',
                      icon: Icons.access_alarm,
                      color: selectedCalculation == CalculationType.time
                          ? kActiveTextColor
                          : kInactiveTextColor,
                      labelStyle: selectedCalculation == CalculationType.time
                          ? kActiveLabelTextStyle
                          : kInactiveLabelTextStyle,
                    ),
                    onPress: () {
                      setState(() {
                        selectedCalculation = CalculationType.time;
                      });
                    }),
                /**DISTANCE CARD */
                CalculationCard(
                    colour: selectedCalculation == CalculationType.distance
                        ? kActiveCardColor
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      labelText: 'DISTANCE',
                      icon: Icons.timeline,
                      color: selectedCalculation == CalculationType.distance
                          ? kActiveTextColor
                          : kInactiveTextColor,
                      labelStyle:
                          selectedCalculation == CalculationType.distance
                              ? kActiveLabelTextStyle
                              : kInactiveLabelTextStyle,
                    ),
                    onPress: () {
                      setState(() {
                        selectedCalculation = CalculationType.distance;
                      });
                    }),
              ],
            ),
            Expanded(
              child: testFunction(selectedValue: selectedCalculation),
            ),
          ],
        ),
      ),
    );
  }
}
