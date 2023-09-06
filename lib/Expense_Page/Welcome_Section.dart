import 'package:expense_manager/Backend/Appwrite_provider.dart';
import 'package:flutter/material.dart';
import 'package:expense_manager/Utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:expense_manager/Authentication/Auth_Provider/Auth_Provider.dart';


class WelcomeSection extends StatefulWidget {
  @override
  State<WelcomeSection> createState() => _WelcomeSectionState();
}

class _WelcomeSectionState extends State<WelcomeSection> {
  @override
  Widget build(BuildContext context) {
    Auth_State state = Provider.of<Auth_State>(context);
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        width: width,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                blurStyle: BlurStyle.normal,
                offset: Offset(0, 3),
              )
            ]),
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
                      Expanded(child: Container(margin: const EdgeInsets.all(5), child: CircleAvatar(
                        child: Image(image: AssetImage('Assets/Images/img_1.png'),),
                      ))),
                      Expanded(
                        flex: 5,
                        child: Text(
                          "Hii , ${snapshot.data!}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
