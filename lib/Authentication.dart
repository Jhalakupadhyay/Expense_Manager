import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:expense_manager/constants.dart';
import 'package:flutter/widgets.dart';

class AuthState extends ChangeNotifier {
  bool LoggedIn = false;
  Client client = Client();
  late Account account;
  late final databases;
  bool selected = true;
  double savedAmount = 0;
  double totalSavings = 0;
  double totalExpenditure = 0;
  RealtimeSubscription? subscription;

  AuthState() {
    _init();
  }

  void _init() {
    client
        .setEndpoint(constants.API_Endpoint)
        .setProject(constants.projectID)
        .setSelfSigned(status: true);
    account = Account(client);
    databases = Databases(client);
  }

  // Function for Register user
  Register_User(String name, String mail, String password) async {
    try {
      final user = await account.create(
        userId: ID.unique(),
        email: mail,
        password: password,
        name: name,
      );
      print(user);
      //user.status == true ? await Login_User(mail, password) : print('Not Registered');
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  // Function for Login
  Future Login_User(String mail, String password) async {
    try {
      final session = await account.createEmailSession(
        email: mail,
        password: password,
      );
      LoggedIn = true;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //Function to Logout user
  Future Logout_User() async {
    try {
      await account.deleteSession(sessionId: 'current');
      LoggedIn = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //Function to get user name
  Future<String> getUserName() async {
    try {
      final user = await account.get();
      return user.name;
    } catch (e) {
      print(e.toString());
      return '';
    }
  }

  //Adding Data to the DataBase
  Future<void> addData({required String reason, required double amount}) async {
    try {
      final document = await databases.createDocument(
        databaseId: constants.database_ID,
        collectionId: constants.collection_ID,
        documentId: ID.unique(),
        data: {
          'Reason': reason,
          'Date': DateTime.now().toString(),
          'Amount': amount,
          'Saved_Amount': savedAmount,
          'Total_Savings': totalSavings,
          'Total_Expenditure': totalExpenditure,
        },
        permissions: [
          Permission.read(Role.any()),
          Permission.write(Role.any()),
        ],
      );
      notifyListeners();
    } on AppwriteException catch (e) {
      print(e);
    }
  }

  //Getting Data from the DataBase
  Future<DocumentList> getData() async {
    return databases.listDocuments(
      databaseId: constants.database_ID,
      collectionId: constants.collection_ID,
    );
  }

  //To update the current Balanace
  void updateBalance(double balance) {
    if (selected) {
      savedAmount += balance;
      totalSavings += balance;
    } else {
      savedAmount -= balance;
      totalExpenditure += balance;
    }
    notifyListeners();
  }

  List<Document>? expenses = [];
  void fetchData() async {
    try {
      final value = await getData();
      expenses = value.documents;
      // Calculate savedAmount, totalSavings, and totalExpenditure from expenses
      savedAmount = expenses?.last.data['Saved_Amount'] ?? 0;
      totalSavings = expenses?.last.data['Total_Savings'] ?? 0;
      totalExpenditure = expenses?.last.data['Total_Expenditure'] ?? 0;
    } catch (e) {
      print(e);
    }
  }

  //Setter for Selected
  void set_selected(bool TF) {
    selected = TF;
    notifyListeners();
  }
}
