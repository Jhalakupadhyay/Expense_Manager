import 'package:expense_manager/Backend/Appwrite_provider.dart';
import 'package:expense_manager/Authentication/Auth_UI/Signin.dart';
import 'package:expense_manager/Authentication/Auth_UI/Signup.dart';
import 'package:expense_manager/Expense_Page/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_manager/Authentication/Auth_Provider/Auth_Provider.dart';
import 'package:expense_manager/Authentication/Auth_Provider/AutoLogin/CheckUserAuthenticated.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth_State>(create: (_) => Auth_State()),
        ChangeNotifierProvider<data_base>(create: (_) => data_base()),
      ],
      child: MaterialApp(
        title: 'Expense_Manager',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.deepOrange,
            fontFamily: 'PTSerif'),
        initialRoute: 'Loding',
        routes: {
          'Loding': (context) => CheckUserAuth(),
          'Signup': (context) => Signup(),
          'LandingPage': (context) => Land_Page(),
          'LoginPage': (context) => login(),
        },
      ),
    );
  }
}



// return ChangeNotifierProvider<AuthState>(
//   create: (BuildContext context) => AuthState(),
//   child: MaterialApp(
//     title: 'Expense_Manager',
//     theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: Colors.deepOrange,
//         fontFamily: 'PTSerif'
//     ),
//     initialRoute: 'Signup',
//     routes:
//     {
//       'Signup': (context) =>  Signup(),
//       'LandingPage':(context) =>  Land_Page(),
//       'LoginPage':(context) =>  login(),
//     },
//   ),
// );
