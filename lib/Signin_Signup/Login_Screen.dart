import 'package:flutter/material.dart';
import 'package:expense_manager/constants.dart';
import 'TextFieldUi.dart';
import 'package:provider/provider.dart';
import 'package:expense_manager/Authentication.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.body_color,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
                child: Image(
                  image: AssetImage('Assets/Images/img.png'),
                  height: 120,
                  width: 120,
                )),
            const Expanded(
              child: Text(
                'EXPENSE MANAGER',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: constants.appbar_color,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Expanded(
                        child: TextBox(
                          s: 'Enter Your MailID',
                          onChanged: (value)
                          {
                            email = value;
                          },
                        ),),
                    Expanded(
                        child: TextBox(
                          s: 'Enter Your Password',
                          onChanged: (value)
                          {
                            password = value;
                          },
                        )),
                    Expanded(
                      flex: 2,
                      child: TextButton(
                        onPressed: ()
                        async {
                          AuthState state = Provider.of<AuthState>(context, listen: false);
                          state.Login_User(email, password);
                          await state.LoggedIn?Navigator.pushNamed(context, 'LandingPage'):print('error');
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 15,bottom: 15,left: 25,right: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: constants.body_color,
                          ),
                          child: Text('Login',style: TextStyle(color: Colors.black),),
                        ),
                      ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
