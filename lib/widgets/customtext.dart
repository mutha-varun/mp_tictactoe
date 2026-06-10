import 'package:flutter/material.dart';

class Customtext extends StatelessWidget {
  final List<Shadow> shadows;
  final String text;
  final double fontSize;
  
  const Customtext({super.key, required this.shadows, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        shadows: shadows
      ),
    );
  }
}