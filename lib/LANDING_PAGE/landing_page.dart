import 'package:expense_manager/LANDING_PAGE/Drawer_Design.dart';
import 'package:expense_manager/constants.dart';
import 'package:flutter/material.dart';
import 'Expenses_Section.dart';
import 'Welcome_Section.dart';
import 'Animated_Floting_Button.dart';

class Land_Page extends StatefulWidget {
  const Land_Page({Key? key}) : super(key: key);
  @override
  State<Land_Page> createState() => _Land_PageState();
}

class _Land_PageState extends State<Land_Page> with TickerProviderStateMixin{
  late AnimationController _controller;
  late AnimationController _controller1;
  late Animation<double> animation;
  double turns = 0.0;
  bool isclicked = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _controller1 = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
        reverseDuration: const Duration(milliseconds: 400),
    );
    animation = Tween<double>(
      begin: 0.0,
      end: 200.0,
    ).animate(_controller1)..addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: constants.body_color,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
          ),
          title: const Text(
            "Expenses",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          backgroundColor: constants.appbar_color,
          leading: Container(
            padding: const EdgeInsets.all(10),
            child: const Image(
              image: AssetImage('Assets/Images/img.png'),
            ),
          ),
        ),
        bottomSheet: B_Sheet(animation: animation,controller: _controller,controller1: _controller1,turns: turns,isclicked: isclicked,),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: animated(controller: _controller,controller1: _controller1,turns: turns, isclicked: isclicked,),
        bottomNavigationBar: BottomAppBar(
          color: constants.bottom_bar,
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.all(10), child: Icon(Icons.home_filled)),
            ],
          ),
        ),
        body: Column(
          children:  [
            Expanded(child: WelcomeSection()),
            Expanded(flex: 9,child: Expenses()),
          ],
        ),
      ),
    );
  }
}

