import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final BorderRadius radius;
  final String text;
  final Color color;
  const Button({Key? key, required this.radius, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: color,
          borderRadius: radius),
      child: Text(text),
    );
  }
}
