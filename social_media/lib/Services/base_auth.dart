import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class BaseAuth {
  dynamic signIn(String email, String password, BuildContext context);
  void signUp();
  void logOut();
}
