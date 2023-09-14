import 'package:expense_manager/Backend/Appwrite_provider.dart';
import 'package:flutter/material.dart';
import 'package:expense_manager/Utils/constants.dart';
import 'package:provider/provider.dart';
import 'Button.dart';
import 'Text_Field_UI.dart';
import 'package:provider/provider.dart';

class B_Sheet extends StatefulWidget {
  final Animation<double> animation;
  final AnimationController controller;
  final AnimationController controller1;
  double turns;
  bool isclicked;
  B_Sheet(
      {required this.animation,
      required this.controller,
      required this.controller1,
      required this.turns,
      required this.isclicked});

  @override
  State<B_Sheet> createState() => _B_SheetState();
}

class _B_SheetState extends State<B_Sheet> {
  TextEditingController text = TextEditingController();
  TextEditingController amount = TextEditingController();
  late Color color;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color = Colors.greenAccent.withAlpha(100);
  }
  @override
  Widget build(BuildContext context) {
    data_base state = Provider.of<data_base>(context,listen: false);
    bool selected = true;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: widget.animation.value,
          width: double.infinity,
          color: color,
          child: Column(
            children: [
              //Row for Credited and Debited button
              Expanded(
                child: Row(
                  children: [
                    // Button for credited money addition
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            color = Colors.greenAccent.withAlpha(100);
                            selected = true;
                            state.selected = selected;
                            print(state.selected);
                          });
                        },
                        child:  Button(
                          radius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          text: 'Credited',
                          color: Colors.greenAccent.withAlpha(200),
                        ),
                      )),
                    //Button for debited money addition
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          color = Colors.redAccent.withAlpha(100);
                          selected = false;
                          state.selected = selected;
                          print(state.selected);
                        });
                      },
                      child: Button(
                        radius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        text: 'Debited',
                        color: Colors.redAccent.withAlpha(100),
                      ),
                    ))
                  ],
                ),
              ),
              //Row for adding expenses and text related to it
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    // Text About Expense is to be added here
                    Expanded(
                      flex: 3,
                      child: Text_Field(text: 'Text Here', t1: text, i: AssetImage('Assets/Images/choice.png'),
                      ),
                    ),
                    //To add the value of money credited or debited
                    Expanded(
                      flex: 3,
                      child: Text_Field(text: 'Enter Amount', t1: amount, i: AssetImage('Assets/Images/money.png'),
                      ),
                    ),
                    //Button to finaly add the Expense
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          //to remove the focus on textfield thus closing keyboard
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          state.fetchData();
                          state.updateBalance(double.tryParse(amount.text) ?? 0.0 );
                          state.addData(reason: text.text, amount: double.tryParse(amount.text) ?? 0.0,credited: selected);
                          // to close the bottom sheet with animation on clicking check icon
                          setState(() {
                            text.clear();
                            amount.clear();
                            widget.controller.reverse();
                            widget.controller1.reverse();
                            widget.turns += 1 / 4;
                            widget.isclicked = !widget.isclicked;
                          });
                          },
                        icon: const Icon(Icons.check),
                        color: constants.appbar_color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
