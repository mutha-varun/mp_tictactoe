import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const Custombutton({required this.onTap,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 5,
            spreadRadius: 0
          )
        ]
      ),
      child: ElevatedButton(
        onPressed: onTap, 
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(15)
          ),
          minimumSize: Size(width, 60),
          shadowColor: Colors.blue.shade100,
          foregroundColor: Colors.amber,
          backgroundColor: Colors.blue.shade900,
          overlayColor: Colors.black,
        ),
        child: Text(text,
          style: const TextStyle(
            fontSize: 20
          ),
        )
      ),
    );
  }
}