import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_media/Services/auth.dart';
import 'package:social_media/Utils/validators.dart';

class AuthScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // email section
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const SizedBox(height: 80),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                if (!Validators().validateEmailMessage(_emailController.text)) {
                  Fluttertoast.showToast(
                      msg: "Please make your email valid!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if (!Validators()
                    .validatePasswordMessage(_passwordController.text)) {
                  Fluttertoast.showToast(
                      msg:
                          "Your password should be atleast 6 characters long also contains special characters & Capital letters",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else {
                  Authentication().signIn(
                      _emailController.text, _passwordController.text, context);
                }
              },
              child: const Text("Login !"),
            )
          ],
        ),
      ),
    );
  }
}
