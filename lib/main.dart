import 'package:app_shoes/home/home.dart';
import 'package:app_shoes/login/login.dart';
import 'package:app_shoes/principal.dart';
import 'package:app_shoes/register/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppShoes());
}

class AppShoes extends StatelessWidget {
  const AppShoes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Shoes x1",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple, scaffoldBackgroundColor: Colors.indigo[900]),
      color: const Color.fromARGB(0, 0, 0, 0),
      initialRoute: "/",
      routes: {
        "/": (context) => const Principal(),
        "/Register": (context) => const Register(),
        "/Login": (context) => const Login(),
        "/Home": (context) => const Home(),
      },
    );
  }
}
