import 'package:expense_manager/LANDING_PAGE/Animated_Floting_Button.dart';
import 'package:flutter/material.dart';

class B_Sheet extends StatelessWidget {
  final Animation<double> animation;
  B_Sheet({required this.animation});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: animation.value,
      width: double.infinity,
      decoration: BoxDecoration(
      ),
    );
  }
}
