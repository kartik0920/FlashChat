import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flashchat/component/inputFields.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 1,
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            InputBox(text: 'Enter your Email'),
            SizedBox(
              height: 8.0,
            ),
            InputBox(text: 'Enter your Password'),
            SizedBox(
              height: 24.0,
            ),
            ActionButton(text: 'Login'),
          ],
        ),
      ),
    );
  }
}
