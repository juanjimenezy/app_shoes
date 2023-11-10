import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

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
          child: Center(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Image(image: AssetImage('assets/img/logo.png')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "PTSerif")),
                        ),
                        const SizedBox(width: 10.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(16.0), // Espaciado interno
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0), // Forma del botón
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("Sign Up", style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "PTSerif")),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
