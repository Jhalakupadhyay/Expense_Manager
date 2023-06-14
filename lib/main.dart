import 'package:expense_manager/Authentication.dart';
import 'package:expense_manager/Signin_Signup/Login_Screen.dart';
import 'package:expense_manager/Signin_Signup/Signup.dart';
import 'package:expense_manager/LANDING_PAGE/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthState>(
      create: (BuildContext context) => AuthState(),
      child: MaterialApp(
        title: 'Expense_Manager',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.deepOrange,
            fontFamily: 'PTSerif'
        ),
        initialRoute: 'LandingPage',
        routes:
        {
          'Signup': (context) =>  Signup(),
          'LandingPage':(context) =>  Land_Page(),
          'LoginPage':(context) =>  login(),
        },
      ),
    );
  }
}
