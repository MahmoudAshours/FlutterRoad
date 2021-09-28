import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/Models/error_messages.dart';
import 'package:social_media/Services/base_auth.dart';
import 'package:social_media/Utils/dialog.dart';

class Authentication extends BaseAuth {
  @override
  void logOut() {
    // TODO: implement logOut
  }

  @override
  dynamic signIn(String email, String password, context) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (c) => CustomizedDialog(
          title: ErrorData.userNotFound,
          description: ErrorData.userNotFoundMessage,
          buttonText: 'Ok',
        ),
      );
    }
  }

  @override
  void signUp() {
    // TODO: implement signUp
  }
}
