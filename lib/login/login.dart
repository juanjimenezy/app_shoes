// ignore_for_file: use_build_context_synchronously

import 'package:app_shoes/components/global.dart';
import 'package:app_shoes/components/messageDialog.dart';
import 'package:app_shoes/login/loginService.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

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
                      decoration: const InputDecoration(hintText: "Email", border: InputBorder.none, labelText: "Email"),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: 50,
                    color: Colors.purple.withOpacity(0.2),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          hintText: "Contraseña",
                          border: InputBorder.none,
                          labelText: "Contraseña",
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          )),
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
                      if (!validarUsuario(emailController.text, passwordController.text)) {
                        MessageDialog.mostrar(context, "Alerta!", "Ingrese los campos.");
                      } else if (logear(emailController.text, passwordController.text)) {
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
    if (inEmail.isEmpty || inPassword.isEmpty) {
      return false;
    }
    return true;
  }

  logear(String inEmail, String inPassword) async {
    Map<String, dynamic> response = await LoginService.loginUser(correo: inEmail, clave: inPassword);
    if (response.containsKey('Validacion')) {
      String validacion = response["Validacion"];
      if (validacion == "Error") {
        String mensaje = response["Mensaje"];
        MessageDialog.mostrar(context, validacion, mensaje);
      }
      if (validacion == "OK") {
        final row = response["row"];
        GlobalVariables.user = row["id"];
        Navigator.pushNamed(context, "/Home");
      }
    }
  }
}
