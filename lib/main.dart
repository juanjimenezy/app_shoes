import 'package:app_shoes/principal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      },
    );
  }
}
