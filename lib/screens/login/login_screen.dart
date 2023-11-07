import 'package:alpha23/screens/login/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      const Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text("Please login to access your todo list"),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(hintText: "Enter phone number", hintStyle: TextStyle(color: Colors.blueGrey)),
                        onFieldSubmitted: (value) {
                          print("done $value");
                        },
                        validator: (value) {
                          var phoneRegEx = RegExp(r'^[0-9]{8,}$');
                          if (value == null || value.isEmpty) {
                            return "Please enter a phone number";
                          } else if (!phoneRegEx.hasMatch(value)) {
                            return "Please enter a valid phone number";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          "We will send a verification code to your phone number",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    showVerifyDialog();
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          "Log in",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, letterSpacing: 1.2),
                        ),
                      )),
                ),
                SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }

  showVerifyDialog() {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(243, 245, 246, 1.0),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: "",
        pageBuilder: (context, anim1, anim2) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Verify your phone",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Please enter the verification code that sent to your phone."),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Pinput(
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      length: 4,
                      autofocus: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      // todo
                      print("login");
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, letterSpacing: 1.2),
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      // todo
                      print("login");
                    },
                    child: Ink(
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Text(
                              "Resend code",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.2,
                                height: 2,
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
