import 'package:expense_manager/Signin_Signup/Authentication.dart';
import 'package:expense_manager/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Button_Design.dart';
import 'Welcome_Section.dart';

class Land_Page extends StatelessWidget {
  const Land_Page({Key? key}) : super(key: key);

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
        floatingActionButton: const Button_Bottom(),
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
          ],
        ),
      ),
    );
  }
}

