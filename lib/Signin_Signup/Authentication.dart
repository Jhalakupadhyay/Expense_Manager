import 'package:appwrite/appwrite.dart';
import 'package:expense_manager/constants.dart';
import 'package:flutter/widgets.dart';


class AuthState extends ChangeNotifier {
  bool LoggedIn = false;
  Client client = Client();
  late Account account;



  AuthState() {
    _init();
  }


  void _init() {
    client.setEndpoint(constants.API_Endpoint).setProject(constants.projectID);
    account = Account(client);
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
      if (user != null) {
        await Login_User(mail, password);
      }
    } catch (e) {
      print(e);
    }
  }


  // Function for Login
  Future Login_User(String mail, String password) async{
    try {
      final session =  account
          .createEmailSession(
        email: mail,
        password: password,
      );
      if (session != null) {
        LoggedIn = true;
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
    try
    {
      final res = await account.get();
      print(res);
    }catch(e){
      print(e.toString());
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
