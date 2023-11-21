import 'package:app_shoes/components/messageDialog.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final List<Map<String, dynamic>> usuario = [
    {"id": 1, "email": "prueba@gmail.com", "password": "123456"}
  ];

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
                      controller: emailController,
                      decoration: const InputDecoration(hintText: "Email", border: InputBorder.none),
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.82),
                      padding: const EdgeInsets.all(16.0), // Espaciado interno
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Forma del botón
                      ),
                    ),
                    onPressed: () {
                      if (validarUsuario(emailController.text, passwordController.text)) {
                        Navigator.pushNamed(context, "/Home");
                      } else {
                        MessageDialog.mostrar(context, "Alerta!", "Email o contraseña incorrectos.");
                      }
                    },
                    child: const Text("Login", style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "PTSerif")),
                  ),
                  const SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/Register");
                    },
                    child: const Text("Registrarse", style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "PTSerif")),
                  ),
                  const SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/Recover");
                    },
                    child: const Text("¿Olvidates tu contraseña?", style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "PTSerif", decoration: TextDecoration.underline)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  validarUsuario(String inEmail, String inPassword) {
    if (inEmail != usuario[0]["email"] || inPassword != usuario[0]["password"]) {
      return false; //TODO modo dev: true
    }
    return true;
  }
}
