import 'package:expense_manager/constants.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
class AuthState extends ChangeNotifier
{
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

  Register_User(String mail,String password,String name)
  {
    final user = account?.create(
      userId: ID.unique(),
      email:mail,
      password: password,
      name: name,
    );
  }
}
