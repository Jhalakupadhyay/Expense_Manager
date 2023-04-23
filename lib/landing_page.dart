import 'package:expense_manager/constants.dart';
import 'package:flutter/material.dart';

class Land_Page extends StatelessWidget {
  const Land_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.body_color,
      appBar: AppBar(
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: constants.bottom_bar,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: constants.bottom_bar,
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.all(10), child: Icon(Icons.home_filled)),
          ],
        ),
      ),
    );
  }
}
