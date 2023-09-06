import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:expense_manager/Utils/constants.dart';
import 'package:flutter/widgets.dart';

class Auth_State extends ChangeNotifier
{
  bool LoggedIn = false;
  Client client = Client();
  late Account account;
  late final databases;
  bool selected = true;
  late User _user;

  //Constructor of the class
  Auth_State() {
    _init();
  }

  //init method for running desired function at the start
  void _init() {
    client
        .setEndpoint(constants.API_Endpoint)
        .setProject(constants.projectID)
        .setSelfSigned(status: true);
    account = Account(client);
    databases = Databases(client);
  }

  //functon to register user
  Register_User(String name, String mail, String password) async {
    try {
      final user = await account.create(
        userId: ID.unique(),
        email: mail,
        password: password,
        name: name,
      );
      _user = user;
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
}