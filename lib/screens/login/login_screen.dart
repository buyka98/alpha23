import 'package:alpha23/screens/login/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign in"),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          shrinkWrap: true,
          reverse: true,
          children: [
            Text("Please enter your valid phone number"),
            SizedBox(
              height: 200,
            ),
            SignInForm(),
          ].reversed.toList(),
        ),
      ),
    );
  }
}
