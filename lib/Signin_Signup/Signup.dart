import 'package:expense_manager/constants.dart';
import 'package:flutter/material.dart';
import 'TextFieldUi.dart';
import 'Authentication.dart';
class Signup extends StatefulWidget {
  const   Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  AuthState state = new AuthState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.body_color,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
                child: Image(
              image: AssetImage('images/img.png'),
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
                          state.name = value;
                        });
                          }
                    )),
                    Expanded(
                        child: TextBox(
                      s: 'Enter Your MailID',
                          onChanged: (value)
                          {setState(() {
                            state.mail = value;
                          });
                          },
                    )),
                    Expanded(
                        child: TextBox(
                      s: 'Enter Your Password',
                          onChanged: (value)
                          {setState(() {
                            state.password = value;
                          });
                          },
                    )),
                    Expanded(
                        flex: 2,
                        child: TextButton(
                          onPressed: ()
                          {
                            setState(() {
                              state.Register_User();
                            });
                            Navigator.pushNamed(context, 'LandingPage');
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 15,bottom: 15,left: 25,right: 25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: constants.body_color,
                            ),
                            child: Text('SignUp',style: TextStyle(color: Colors.black),),
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
