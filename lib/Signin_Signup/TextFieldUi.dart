import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  String s = "";
  final  Function(String)? onChanged;
  TextBox({required this.s, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: s,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black54,
        ),
        border: const OutlineInputBorder(
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
