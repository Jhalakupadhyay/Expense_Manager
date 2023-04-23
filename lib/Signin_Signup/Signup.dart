import 'package:flutter/material.dart';
import 'TextFieldUi.dart';
import 'Authentication.dart';
class Signup extends StatefulWidget {
  const   Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String name = "";
  String password = "";
  String mail = "";
  AuthState state = new AuthState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
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
                  color: Colors.indigo[400],
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
                          }
                    )),
                    Expanded(
                        child: TextBox(
                      s: 'Enter Your MailID',
                          onChanged: (value)
                          {setState(() {
                            mail = value;
                          });
                          },
                    )),
                    Expanded(
                        child: TextBox(
                      s: 'Enter Your Password',
                          onChanged: (value)
                          {setState(() {
                            password = value;
                          });
                          },
                    )),
                    Expanded(
                        flex: 2,
                        child: TextButton(
                          onPressed: ()
                          {
                            setState(() {
                              state.Register_User(mail, password, name);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 15,bottom: 15,left: 25,right: 25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.indigo[900]
                            ),
                            child: Text('SignUp',style: TextStyle(color: Colors.white),),
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
