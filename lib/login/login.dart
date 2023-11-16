import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                      decoration: const InputDecoration(hintText: "Usuario", border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: 50,
                    color: Colors.purple.withOpacity(0.2),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(hintText: "Contraseña", border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(16.0), // Espaciado interno
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0), // Forma del botón
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/Register");
                      },
                      child: const Text("Login", style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "PTSerif")),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
