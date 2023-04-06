import 'package:flutter/material.dart';
import 'package:expense_manager/main.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(child: Image(
                image: AssetImage('images/img.png'),
              height: 120,
              width: 120,
            )),
            const Expanded(
              child: Text('EXPENSE MANAGER',style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
            ),
            Expanded(
              flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo[400],
                    borderRadius: const BorderRadius.only(topRight:Radius.circular(20),
                    topLeft: Radius.circular(20))
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      TextField(),
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
