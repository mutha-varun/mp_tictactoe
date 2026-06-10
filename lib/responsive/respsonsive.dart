import 'package:flutter/material.dart';

class Respsonsive extends StatelessWidget {
  final Widget child;
  const Respsonsive({required this.child,super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: child,
      ),
    );
  }
}