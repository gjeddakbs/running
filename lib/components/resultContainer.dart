import 'package:flutter/material.dart';
import 'package:run_app/constants.dart';

class ResultContainer extends StatefulWidget {
  final String resultText;
  final String result;
  ResultContainer({required this.resultText, required this.result});
  // const ResultContainer({Key? key}) : super(key: key);

  @override
  _ResultContainerState createState() => _ResultContainerState();
}

class _ResultContainerState extends State<ResultContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBottomContainerColor,
      margin: EdgeInsets.only(top: 15.0),
      width: double.infinity,
      height: kBottomContainerHeight,
      padding: EdgeInsets.only(bottom: 15.0),
      child: Center(
        child: Text(
          "${widget.resultText} \n ${widget.result}",
          style: kLargeButtonTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
