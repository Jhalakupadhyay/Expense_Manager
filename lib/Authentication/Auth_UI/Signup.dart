import 'package:expense_manager/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'TextFieldUi.dart';
import 'package:expense_manager/Authentication/Auth_Provider/Auth_Provider.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String name = "";
  String password = "";
  String mail = "";
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Auth_State>(context,listen : false);
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
                      s: 'Enter Name',
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      obscureText: false,
                    )),
                    Expanded(
                        child: TextBox(
                      s: 'Enter Your MailID',
                      onChanged: (value) {
                        setState(() {
                          mail = value;
                        });
                      },
                      obscureText: false,
                    )),
                    Expanded(
                        child: TextBox(
                      s: 'Enter Your Password',
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      obscureText: true,
                    )),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () async {
                              setState(() {
                                state.Register_User(name, mail, password);
                              });
                              await state.LoggedIn
                                  ? Navigator.pushNamed(context, 'LandingPage')
                                  : Navigator.pushNamed(context, 'LoginPage');
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 15, bottom: 15, left: 25, right: 25),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: constants.body_color,
                              ),
                              child: Text(
                                'SignUp',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'LoginPage');
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 15, bottom: 15, left: 25, right: 25),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: constants.body_color,
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
