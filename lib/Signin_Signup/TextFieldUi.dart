import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  String s = "";
  TextBox({required this.s});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: s,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black54,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
      ),
    );
  }
}
