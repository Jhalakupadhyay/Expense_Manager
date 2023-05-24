import 'package:expense_manager/constants.dart';
import 'package:flutter/material.dart';

class Expenses extends StatelessWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,bottom: 35,left: 10,right: 10),
      decoration: BoxDecoration(
          color: constants.appbar_color.withAlpha(130),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(0, 3),
            )
          ]),
      );
  }
}
