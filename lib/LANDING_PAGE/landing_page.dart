import 'package:expense_manager/constants.dart';
import 'package:flutter/material.dart';
import 'Expenses_Section.dart';
import 'Welcome_Section.dart';
import 'Animated_Floting_Button.dart';

class Land_Page extends StatefulWidget {
  @override
  State<Land_Page> createState() => _Land_PageState();
}

class _Land_PageState extends State<Land_Page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animated();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: constants.body_color,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
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
              image: AssetImage('images/img.png'),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: animated(),
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

