import 'package:expense_manager/LANDING_PAGE/landing_page.dart';
import 'package:expense_manager/constants.dart';
import 'package:flutter/material.dart';

class animated extends StatefulWidget {
  final AnimationController controller;
  final AnimationController controller1;
  final double turns;
  final bool isclicked;
  const animated({Key? key, required this.controller, required this.controller1,required this.turns, required this.isclicked,}) : super(key: key);
  @override
  State<animated> createState() => _animatedState(turns: turns,isclicked: isclicked);
}

class _animatedState extends State<animated> with TickerProviderStateMixin {
  double turns;
  bool isclicked;
  _animatedState({required this.turns,required this.isclicked});
  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
        turns: widget.turns,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        child: FloatingActionButton(
          backgroundColor: constants.bottom_bar,
          onPressed: () {
            if (isclicked) {
              setState(() => turns -= 1 / 4);
              widget.controller.reverse();
              widget.controller1.reverse();
            } else {
              setState(() => turns += 1 / 4);
              widget.controller.forward();
              widget.controller1.forward();
            }
            isclicked = !isclicked;
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: widget.controller,
          ),
        ));
  }
}
