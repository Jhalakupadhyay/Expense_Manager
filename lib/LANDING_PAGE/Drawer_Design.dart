import 'package:flutter/material.dart';
import 'package:expense_manager/constants.dart';

class B_Sheet extends StatefulWidget {
  final Animation<double> animation;
  final AnimationController controller;
  final AnimationController controller1;
  double turns;
  bool isclicked;
  B_Sheet({required this.animation, required this.controller, required this.controller1,required this.turns,required this.isclicked});

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
              Expanded(
                  child: Row(
                  children: [
                  // Button for credited money addition

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          color = Colors.greenAccent.withAlpha(100);
                          selected = false;
                        });
                      },
                      child:  Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.withAlpha(200),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: const Text('Credited'),
                      ),
                    ),
                  ),

                  //Button for debited money addition

                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        color = Colors.redAccent.withAlpha(100);
                        selected = true;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.redAccent.withAlpha(200),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Text('Debited'),
                    ),
                  ))
                ],
              ),),


              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    // Text About Expense is to be added here
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child:  TextField(
                          controller: text,
                          decoration: const InputDecoration(
                              hintText: 'Text Here',
                              icon: Image(
                                image: AssetImage('Assets/Images/choice.png'),
                                height: 25,
                              )),
                        ),
                      ),
                    ),
                    //To add the value of money credited or debited
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child:  TextField(
                          controller: amount,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Enter Amount',
                              icon: Image(
                                image: AssetImage('Assets/Images/money.png'),
                                height: 25,
                              ),),
                        ),
                      ),
                    ),

                    //Button to finaly add the Expense

                    Expanded(
                      child: IconButton(onPressed: ()
                      {
                        //to remove the focus on textfield thus closing keyboard
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        // to close the bottom sheet with animation on clicking check icon
                        setState(() {
                          text.clear();
                          amount.clear();
                          widget.controller.reverse();
                          widget.controller1.reverse();
                          widget.turns+=1/4;
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
