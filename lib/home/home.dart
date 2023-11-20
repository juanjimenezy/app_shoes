import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background1.png'), // Ruta de la imagen de fondo
            fit: BoxFit.cover, // Ajustar la imagen al tamaño del contenedor
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image(
                  image: AssetImage('assets/img/nike.png'),
                ),
              ),
              SizedBox(
                width: 150,
                height: 150,
                child: Image(
                  image: AssetImage('assets/img/adidas.png'),
                ),
              ),
              SizedBox(
                width: 150,
                height: 150,
                child: Image(
                  image: AssetImage('assets/img/puma.png'),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
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
                  Navigator.pushNamed(context, "/Home");
                },
                child: const Icon(Icons.home),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/Register");
                },
                child: const Icon(Icons.history),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/Register");
                },
                child: const Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
