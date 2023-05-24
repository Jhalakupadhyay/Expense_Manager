import 'package:expense_manager/constants.dart';
import 'package:flutter/material.dart';

class animated extends StatefulWidget {
  const animated({Key? key}) : super(key: key);

  @override
  State<animated> createState() => _animatedState();
}

class _animatedState extends State<animated> with TickerProviderStateMixin {
  late AnimationController _controller;
  double turns = 0.0;
  bool isclicked = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500)
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: turns,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
        child: FloatingActionButton(
          onPressed: () {
            if (isclicked) {
              setState(() => turns -= 1 / 4);
              _controller.reverse();
            } else {
              setState(() => turns += 1 / 4);
              _controller.forward();
            }
            isclicked = !isclicked;
          },
          backgroundColor: constants.bottom_bar,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _controller,
          ),
        ),
    );
  }
}
