import 'package:flutter/material.dart';
import 'package:expense_manager/constants.dart';
class Button_Bottom extends StatelessWidget {
  const Button_Bottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: constants.bottom_bar,
      onPressed: () {},
      child: Icon(Icons.add),
    );
  }
}