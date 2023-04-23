import 'package:expense_manager/Signin_Signup/Signup.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:provider/provider.dart';
import 'Signin_Signup/Authentication.dart';

Client client = Client()
    .setEndpoint('http://localhost/v1')
    .setProject('642eedf501f05')
    .setSelfSigned(status: true);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthState(),
      child: MaterialApp(
        title: 'Expense_Manager',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.deepOrange
        ),
        initialRoute: 'Signup',
        routes:
        {
          'Signup': (context) => const Signup(),
        },
      ),
    );
  }
}
