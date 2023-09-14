import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Auth_Provider.dart';

class CheckUserAuth extends StatefulWidget {
  const CheckUserAuth({super.key});

  @override
  State<CheckUserAuth> createState() => _CheckUserAuthState();

}
class _CheckUserAuthState extends State<CheckUserAuth> {

  @override
  void didChangeDependencies() {
    Auth_State state = Provider.of<Auth_State>(context);
    state.CheckUserAuth().then((value){
      if(value)
        {
          Navigator.pushReplacementNamed(context, 'LandingPage');
        }
      else
        {
          Navigator.pushReplacementNamed(context, 'Signup');
        }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
