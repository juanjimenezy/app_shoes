import 'package:flutter/material.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  TextEditingController userController = TextEditingController();

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
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image(image: AssetImage('assets/img/logo.png')),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.purple.withOpacity(0.2),
                    width: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: userController,
                      decoration: const InputDecoration(hintText: "Email", border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.82),
                      padding: const EdgeInsets.all(16.0), // Espaciado interno
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Forma del botón
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/Login");
                    },
                    child: const Text("Recuperar", style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "PTSerif")),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
