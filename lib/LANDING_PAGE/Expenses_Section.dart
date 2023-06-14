import 'package:expense_manager/constants.dart';
import 'package:flutter/material.dart';
import 'package:expense_manager/Authentication.dart';
import 'package:provider/provider.dart';

class Expenses extends StatefulWidget {
  const Expenses({
    Key? key,
  }) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  late AuthState state;
  late num length;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    state = Provider.of<AuthState>(context);
    fetchData();
  }

  void fetchData() async {
    try {
      final value = await state.getData();
      setState(() {
        state.expenses = value.documents;
      });
    } catch (e) {
      print(e);
    }
    setState(() {
      length = state.expenses?.length ?? 0;
      length--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10, bottom: 35, left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              blurStyle: BlurStyle.normal,
              offset: Offset(0, 0),
            )
          ]),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(4),
            width: double.infinity,
            decoration: BoxDecoration(
              color: constants.appbar_color.withAlpha(12000),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              "  Current Balance is:  ${state.expenses != null && state.expenses!.isNotEmpty ? state.expenses!.last.data['Saved_Amount'] : 0.00}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Consumer<AuthState>(
            builder: (context, provider, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: provider.expenses?.length ?? 0,
                  itemBuilder: (context, index) {
                    final expense = provider.expenses![index];
                    final amount = expense.data['Amount'];
                    final reason = expense.data['Reason'];
                    return Dismissible(
                      key: Key(expense.$id),
                      onDismissed: (direction){
                        state.Delete_Document(expense.$id.toString());
                        setState(() {
                          provider.expenses!.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Item Deleted')),
                        );
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Card(
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 10, right: 10),
                            title: Text(
                              reason,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Text(
                              amount.toString(),
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
