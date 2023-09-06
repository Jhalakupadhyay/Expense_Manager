import 'package:flutter/material.dart';
class Text_Field extends StatelessWidget {
  final String text;
  final TextEditingController t1;
  final AssetImage i;
  const Text_Field({Key? key, required this.text, required this.t1, required this.i}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: TextField(
          controller: t1,
          decoration:  InputDecoration(
              hintText: text,
              icon: Image(
                image: i,
                height: 25,
              )),
        ),
      );;
  }
}
