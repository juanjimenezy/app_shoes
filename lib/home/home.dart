import 'package:app_shoes/components/buttonBar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    String ruta = "";
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background1.png'), // Ruta de la imagen de fondo
            fit: BoxFit.cover, // Ajustar la imagen al tamaño del contenedor
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 200,
                  height: 200,
                  child: GestureDetector(
                    onTap: () {
                      ruta = "nike";
                      Navigator.pushNamed(context, '/Catalogue', arguments: ruta);
                    },
                    child: const Image(
                      image: AssetImage(
                        'assets/img/nike.png',
                      ),
                    ),
                  )),
              SizedBox(
                  width: 200,
                  height: 200,
                  child: GestureDetector(
                    onTap: () {
                      ruta = "adidas";
                      Navigator.pushNamed(context, '/Catalogue', arguments: ruta);
                    },
                    child: const Image(
                      image: AssetImage(
                        'assets/img/adidas.png',
                      ),
                    ),
                  )),
              SizedBox(
                  width: 200,
                  height: 200,
                  child: GestureDetector(
                    onTap: () {
                      ruta = "puma";
                      Navigator.pushNamed(context, '/Catalogue', arguments: ruta);
                    },
                    child: const Image(
                      image: AssetImage(
                        'assets/img/puma.png',
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
