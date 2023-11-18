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
    );
  }
}
