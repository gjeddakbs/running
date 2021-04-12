import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  MenuButton({required this.buttonText, required this.destination});

  final String buttonText;
  final String destination;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ElevatedButton(
          // style: Theme.of(context).elevatedButtonTheme.style,
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: () => Navigator.pushNamed(context, destination)),
    );
  }
}
