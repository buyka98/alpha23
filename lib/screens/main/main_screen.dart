import 'package:alpha23/bloc/auth_cubit.dart';
import 'package:alpha23/screens/auth/login_screen.dart';
import 'package:alpha23/screens/home/home_screen.dart';
import 'package:alpha23/screens/loading_screen.dart';
import 'package:alpha23/screens/todo/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  final int? number;
  const MainScreen({super.key, this.number});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: context.watch<AuthCubit>(),
        builder: (context, AuthState state) {
          if (state is RegisterSuccess || state is LoginSuccess) {
            return mainScreen();
          } else if (state is AuthLoading) {
            return LoadingScreen();
          } else {
            return LoginScreen();
          }
        });
  }

  Widget mainScreen() {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: "gallery"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "user")
        ],
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: [
          HomeScreen(),
          TodoScreen(),
          TodoScreen(),
        ][selectedIndex],
      ),
    );
  }
}
