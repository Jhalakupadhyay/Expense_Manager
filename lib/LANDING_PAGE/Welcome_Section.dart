import 'package:expense_manager/Signin_Signup/Authentication.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:expense_manager/constants.dart';
import 'package:provider/provider.dart';


class WelcomeSection extends StatefulWidget {


  @override
  State<WelcomeSection> createState() => _WelcomeSectionState();
}

class _WelcomeSectionState extends State<WelcomeSection> {
  @override
  Widget build(BuildContext context) {
    AuthState state = Provider.of<AuthState>(context);
    double width = MediaQuery.of(context).size.width;
    return  Container(
        width: width,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: constants.appbar_color.withAlpha(130),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Hii,', style: constants.style,),
              FutureBuilder<String> (
                future: state.getUserName(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                    return Text (snapshot.data!);
                  }
                  return CircularProgressIndicator ();
                },
              )
            ],
          ),
    );
  }
}