import 'package:expense_manager/LANDING_PAGE/landing_page.dart';
import 'package:expense_manager/constants.dart';
import 'package:flutter/material.dart';

class animated extends StatefulWidget {
  final AnimationController controller;
  final AnimationController controller1;
  const animated({Key? key, required this.controller, required this.controller1,}) : super(key: key);
  @override
  State<animated> createState() => _animatedState(controller,controller1);
}

class _animatedState extends State<animated> with TickerProviderStateMixin {
  final AnimationController _controller;
  final AnimationController _controller1;
  _animatedState(this._controller, this._controller1);

  double turns = 0.0;
  bool isclicked = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
        turns: turns,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        child: FloatingActionButton(
          backgroundColor: constants.bottom_bar,
          onPressed: () {
            if (isclicked) {
              setState(() => turns -= 1 / 4);
              _controller.reverse();
              _controller1.reverse();
            } else {
              setState(() => turns += 1 / 4);
              _controller.forward();
              _controller1.forward();
            }
            isclicked = !isclicked;
          },
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _controller,
          ),
        ));
  }
}
