// ignore_for_file: use_build_context_synchronously

import 'package:app_shoes/components/messageDialog.dart';
import 'package:app_shoes/login/recoverService.dart';
import 'package:flutter/material.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  TextEditingController emailController = TextEditingController();

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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.82),
                      padding: const EdgeInsets.all(16.0), // Espaciado interno
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Forma del botón
                      ),
                    ),
                    onPressed: () {
                      if (validarUsuario(emailController.text)) {
                        recoverPassword(emailController.text);
                      } else {
                        MessageDialog.mostrar(context, "Alerta!", "Completar campos.");
                      }
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

  validarUsuario(String inEmail) {
    if (inEmail.isEmpty) {
      return false;
    }
    return true;
  }

  recoverPassword(String inEmail) async {
    Map<String, dynamic> response = await RecoverService.recoverUser(correo: inEmail);
    if (response.containsKey('Validacion')) {
      String validacion = response["Validacion"];
      if (validacion == "Error") {
        String mensaje = response["Mensaje"];
        MessageDialog.mostrar(context, validacion, mensaje);
      }
      if (validacion == "OK") {
        MessageDialog.mostrar(context, "Mensaje", "Su nueva contraseña es: 123456");
        //TODO Direccionar a login
      }
    }
    return true;
  }
}
