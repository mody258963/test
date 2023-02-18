import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DummyText extends StatelessWidget {
  final String text;

  const DummyText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 20),
    );
  }
}
