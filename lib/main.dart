import 'package:alpha23/bloc/auth_cubit.dart';
import 'package:alpha23/firebase_options.dart';
import 'package:alpha23/screens/auth/login_screen.dart';
import 'package:alpha23/screens/main/main_screen.dart';
import 'package:alpha23/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var app = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            // TextFormField decoration
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.blueGrey),
              floatingLabelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.redAccent,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.redAccent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.blueAccent,
                ),
              ),
            )),
        home: MainScreen(),
      ),
    );
  }
}
