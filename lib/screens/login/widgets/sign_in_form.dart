import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          maxLength: 8,
          decoration: InputDecoration(
            labelText: "Phone",
            hintText: "Enter phone number",
          ),
          onFieldSubmitted: (value) {
            print("done $value");
          },
        ),
        ElevatedButton(onPressed: () {}, child: Text("Login")),
      ],
    ));
  }
}
