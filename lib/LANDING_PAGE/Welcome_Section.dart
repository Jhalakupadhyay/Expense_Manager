import 'package:expense_manager/Signin_Signup/Authentication.dart';
import 'package:flutter/material.dart';
import 'package:expense_manager/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class WelcomeSection extends StatefulWidget {
  const WelcomeSection({Key? key}) : super(key: key);

  @override
  State<WelcomeSection> createState() => _WelcomeSectionState();
}

class _WelcomeSectionState extends State<WelcomeSection> {
  AuthState state = new AuthState();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color:constants.appbar_color.withAlpha(130),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children:  [
           Text('Hii,',style: constants.style,),
          Text(Provider.of(context).name,style: constants.style,)
        ],
      ),
    );
  }
}
