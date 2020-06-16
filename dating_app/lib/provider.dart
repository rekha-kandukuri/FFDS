import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';


class Login {
  String email;
  String password;
  bool auto =false;

  void saveUserData(String email, String password) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('password', password);
    print('done');
  }

  Future<bool> autoLogin() async
  {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('email'))
    {
      return false;
    }
    else {
      email = prefs.getString('email');
      password = prefs.getString('password');
      return true ;
    }

}
String getEmail()
{
  return email;
}
String getPassword()
{
  return password;
}
Future<void > logOut() async
{
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
}
