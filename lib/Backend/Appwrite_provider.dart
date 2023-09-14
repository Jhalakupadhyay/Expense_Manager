import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:expense_manager/Utils/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:expense_manager/Authentication/Auth_Provider/Auth_Provider.dart';


class data_base extends ChangeNotifier {

  bool selected = true;
  double curr_balance = 0;
  double total_income = 0;
  double total_expend = 0;
  Auth_State state = new Auth_State();
  List<Document>? expenses = [];


  //Adding Data to the DataBase
  Future<void> addData({required String reason, required double amount,required credited}) async {
    try {
      final document = await state.databases.createDocument(
        databaseId: constants.database_ID,
        collectionId: constants.collection_ID,
        documentId: ID.unique(),
        data: {
          'Date': DateTime.now().toString(),
          'Curr_Amount': curr_balance,
          'Total_Expenditure': total_expend,
          'Total_Income': total_income,
          'Amount': amount,
          'Reason':reason,
          'Credited_Debited':credited,
        },
        permissions: [
          Permission.read(Role.any()),
          Permission.write(Role.any()),
          Permission.delete(Role.any()),
        ],
      );
      notifyListeners();
    } on AppwriteException catch (e) {
      print(e);
    }
  }

  //Getting Data from the DataBase
  Future<DocumentList> getData() async {
    return state.databases.listDocuments(
      databaseId: constants.database_ID,
      collectionId: constants.collection_ID,
    );
  }

  //To update the current Balanace
  void updateBalance(double balance) {
    if (selected) {
      curr_balance += balance;
      total_income += balance;
    } else {
      curr_balance -= balance;
      total_expend += balance;
    }
    notifyListeners();
  }
  void fetchData() async {
    try {
      final value = await getData();
      expenses = value.documents;
      // Calculate savedAmount, totalSavings, and totalExpenditure from expenses
      curr_balance = expenses?.last.data['Curr_Amount'] ?? 0;
      total_income = expenses?.last.data['Total_Expenditure'] ?? 0;
      total_expend = expenses?.last.data['Total_Income'] ?? 0;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> Delete_Document(String DocId) async {
      Future result = state.databases.deleteDocument(
      databaseId: constants.database_ID,
      collectionId: constants.collection_ID,
      documentId: DocId,
    );
      result.then((response) {
        print(response);
        return true;
      }).catchError((error) {
        print(error.response);
        return false;
      });
      return false;
  }

  //Setter for Selected
  void set_selected(bool TF) {
    selected = TF;
    notifyListeners();
  }

  // Function to update the last document at the top
  // Future<void> updateLastDocument(double value,bool select) async {
  //   try {
  //     final value = await getData();
  //     if (expenses != null) {
  //       final lastDocId = expenses?.last.$id;
  //       final response = await databases.updateDocument(
  //         databaseId: constants.database_ID,
  //         collectionId: constants.collection_ID,
  //         documentId: lastDocId,
  //         data: {
  //           'Saved_Amount': expenses?.last.data['Saved_Amount'] - (select?value:0.0),
  //           'Total_Savings': expenses?.last.data['Total_Savings']- (select?value:0.0),
  //           'Total_Expenditure': expenses?.last.data['Total_Expenditure']-(!select?value:0.0),
  //         },
  //       );
  //       notifyListeners();
  //       print('Last document updated successfully');
  //     }
  //   } catch (e) {
  //     print('Failed to update the last document: $e');
  //   }

    fetchSavedAmount(double amount,bool select)
    {
      curr_balance = 0;
      if(select)
        {
          curr_balance = expenses?.last.data['Curr_Amount'] - amount;
        }
      else
        {
          curr_balance = expenses?.last.data['Curr_Amount'] + amount;
        }
      notifyListeners();
    }
}
