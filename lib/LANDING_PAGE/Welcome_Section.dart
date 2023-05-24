import 'package:expense_manager/Signin_Signup/Authentication.dart';
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
    return Container(
      width: width,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: constants.appbar_color.withAlpha(130),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<String>(
            future: state.getUserName(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Container(margin: EdgeInsets.all(5), child: CircleAvatar())),
                    Expanded(
                      flex: 5,
                      child: Text(
                        "Hii , " + snapshot.data!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo.shade900,
                        ),
                      ),
                    ),
                  ],
                );
              }
              return CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}
