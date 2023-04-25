import 'package:expense_manager/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:appwrite/appwrite.dart';

class AuthState extends ChangeNotifier
{
  String name = "";
  String password = "";
  String mail = "";

  Client client = Client();
  Account? account;
  AuthState()
  {
    _init();
  }

  void _init()
  {
    client.setEndpoint(constants.API_Endpoint)
        .setProject(constants.projectID);
    account = Account(client);
  }

  Register_User()
  {
    final user = account?.create(
      userId: ID.unique(),
      email:mail,
      password: password,
      name: name,
    );
  }

}
