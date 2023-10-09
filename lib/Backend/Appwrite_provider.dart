import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:expense_manager/Utils/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:expense_manager/Authentication/Auth_Provider/Auth_Provider.dart';
import 'package:welltested_annotation/welltested_annotation.dart';


@Welltested(excludedMethods: ['addData','Update_Document','Delete_Document'])
class data_base extends ChangeNotifier {
  bool selected = true;
  Auth_State state = new Auth_State();
  List<Document>? expenses = [];

  data_base() {
    getData();
  }

  //Setter for Selected
  void set_selected(bool TF) {
    selected = TF;
    print("value of selected is : $selected");
    notifyListeners();
  }

  //Adding Data to the DataBase
  Future<void> addData({required String reason, required double amount}) async {
    try {
      final document = await state.databases.createDocument(
        databaseId: constants.database_ID,
        collectionId: constants.collection_ID,
        documentId: ID.unique(),
        data: {
          'Date': DateTime.now().toString(),
          'Curr_Amount': selected
              ? (expenses!.isNotEmpty
                  ? expenses!.last.data['Curr_Amount'] + amount
                  : 0 + amount)
              : (expenses!.isNotEmpty
                  ? expenses!.last.data['Curr_Amount'] - amount
                  : 0 - amount),
          'Total_Expenditure': !selected
              ? (expenses!.isNotEmpty
                  ? expenses!.last.data['Total_Expenditure'] + amount
                  : 0 + amount)
              : (expenses!.isNotEmpty
                  ? expenses!.last.data['Total_Expenditure']
                  : 0),
          'Total_Income': selected
              ? (expenses!.isNotEmpty
                  ? expenses!.last.data['Total_Income'] + amount
                  : 0 + amount)
              : (expenses!.isNotEmpty
                  ? expenses!.last.data['Total_Income']
                  : 0),
          'Amount': amount,
          'Reason': reason,
          'Credited_Debited': selected,
        },
        permissions: [
          Permission.read(Role.any()),
          Permission.write(Role.any()),
          Permission.delete(Role.any()),
        ],
      );
      notifyListeners();
    } on AppwriteException catch (e) {
      print(e.message);
    }
  }

  //Getting Data from the DataBase
  Future getData() async {
    final value = await state.databases.listDocuments(
      databaseId: constants.database_ID,
      collectionId: constants.collection_ID,
    );
    expenses = value.documents;
  }

  //Deleting Document from the list
  late Document deleted_document;
  Future Delete_Document(String DocId) async {
    try {
      final data = await state.databases.deleteDocument(
        databaseId: constants.database_ID,
        collectionId: constants.collection_ID,
        documentId: DocId,
      );
      print('Document Deleted Successfully');
      getData();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //Updating expenses when a document is deleted
  Future Update_Document() async {
    final result = state.databases.updateDocument(
      databaseId: constants.database_ID,
      collectionId: constants.collection_ID,
      documentId: expenses!.last.$id,
      result:{
        'Curr_Amount':deleted_document.data['Credited_Debited']
            ? (expenses!.isNotEmpty
            ? expenses!.last.data['Curr_Amount'] + deleted_document.data['Amount']
            : 0 + deleted_document.data['Amount'])
            : (expenses!.isNotEmpty
            ? expenses!.last.data['Curr_Amount'] - deleted_document.data['Amount']
            : 0 - deleted_document.data['Amount']),
        'Total_Expenditure': !deleted_document.data['Credited_Debited']
            ? (expenses!.isNotEmpty
            ? expenses!.last.data['Total_Expenditure'] - deleted_document.data['Amount']
            : 0 - deleted_document.data['Amount'])
            : (expenses!.isNotEmpty
            ? expenses!.last.data['Total_Expenditure']
            : 0),
        'Total_Income': !deleted_document.data['Credited_Debited']
            ? (expenses!.isNotEmpty
            ? expenses!.last.data['Total_Income'] - deleted_document.data['Amount']
            : 0 - deleted_document.data['Amount'])
            : (expenses!.isNotEmpty
            ? expenses!.last.data['Total_Income']
            : 0),
      },
    );
    getData();
    notifyListeners();
  }
}
