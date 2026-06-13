import 'package:flutter/material.dart';
import 'package:mp_tictactoe/utils/colors.dart';

class Customtextfield extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final bool isReadOnly;
  const Customtextfield({required this.controller,required this.text,this.isReadOnly = false,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 5,
            spreadRadius: 2 
          )
        ]
      ),
      child: TextField(
        readOnly: isReadOnly,
        enableInteractiveSelection: isReadOnly,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: bgColor,
          filled: true,
          hintText: text
        ),
      ),
    );
  }
}