import 'package:alpha23/cache.dart';
import 'package:alpha23/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isRemember = true;

  @override
  void initState() {
    if (cache.isRemember) {
      emailController.text = cache.rememberEmail!;
      passwordController.text = cache.rememberPassword!;
    }
    super.initState();
  }

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
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: "Enter emailjjsj",
                        ),
                        onFieldSubmitted: (value) {
                          print("done $value");
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a email address";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: "Enter password here",
                          hintText: "hint here",
                        ),
                        onFieldSubmitted: (value) {
                          print("done $value");
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty || value.length < 3) {
                            return "Please enter your password";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isRemember = !isRemember;
                          });
                        },
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              isRemember
                                  ? Icon(
                                      Icons.check_box,
                                      color: Colors.blue,
                                    )
                                  : Icon(Icons.check_box_outline_blank_rounded),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text("Remember me"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
                  },
                  child: Ink(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "Click here to register",
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    cache.rememberUser(isRemember, email: emailController.text, password: passwordController.text);
                    // context.read<AuthCubit>().login(
                    //       email: emailController.text,
                    //       password: passwordController.text,
                    //     );
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
}
