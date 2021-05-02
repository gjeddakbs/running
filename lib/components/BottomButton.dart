import 'package:flutter/material.dart';
import 'package:run_app/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    required this.onTap,
    required this.buttonTitle,
  });

  final String buttonTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 15.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 15.0),
      ),
    );
  }
}
