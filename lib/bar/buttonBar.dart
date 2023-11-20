import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.blue],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        height: 50.0, // Altura del footer
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, "/Home");
              },
              child: const Icon(Icons.home),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, "/History");
              },
              child: const Icon(Icons.history),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, "/Profile");
              },
              child: const Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
