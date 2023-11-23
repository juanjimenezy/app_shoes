// ignore_for_file: use_build_context_synchronously

import 'package:app_shoes/components/buttonBar.dart';
import 'package:app_shoes/components/global.dart';
import 'package:app_shoes/components/messageDialog.dart';
import 'package:app_shoes/profile/profileService.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController paisController = TextEditingController();
  TextEditingController ciudadController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController direccionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    loadData();
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
                  SizedBox(height: 40.0),
                  Image(
                    image: AssetImage(
                      'assets/img/logo.png',
                    ),
                    height: 50,
                    width: 50,
                  ),
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
                      controller: nombreController,
                      decoration: const InputDecoration(hintText: "Nombre", border: InputBorder.none, labelText: "Nombre"),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: 50,
                    color: Colors.purple.withOpacity(0.2),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: paisController,
                      decoration: const InputDecoration(hintText: "Pais", border: InputBorder.none, labelText: "Pais"),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: 50,
                    color: Colors.purple.withOpacity(0.2),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: ciudadController,
                      decoration: const InputDecoration(hintText: "Ciudad", border: InputBorder.none, labelText: "Ciudad"),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: 50,
                    color: Colors.purple.withOpacity(0.2),
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
                      controller: direccionController,
                      decoration: const InputDecoration(hintText: "Dirección", border: InputBorder.none, labelText: "Direcccion"),
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
                      String r = validateInfo(nombreController.text, paisController.text, ciudadController.text, emailController.text, direccionController.text);
                      if (r == "S") {
                        updateData(nombreController.text, paisController.text, ciudadController.text, emailController.text, direccionController.text);
                        Navigator.pushNamed(context, "/Home");
                      } else {
                        MessageDialog.mostrar(context, "Alerta", r);
                      }
                    },
                    child: const Text("Actualizar", style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "PTSerif")),
                  ),
                  const SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Volver", style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "PTSerif")),
                  )
                ],
              ),
              Positioned(
                bottom: 10.0,
                left: 0,
                right: 0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 228, 93, 84), // Color del botón de cerrar sesión
                    padding: const EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text(
                    "Cerrar Sesión",
                    style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "PTSerif"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }

  loadData() async {
    Map<String, dynamic> response = await ProfileService.informationProfile(id: GlobalVariables.user);
    if (response.containsKey('Validacion')) {
      String validacion = response["Validacion"];
      if (validacion == "Error") {
        String mensaje = response["Mensaje"];
        MessageDialog.mostrar(context, validacion, mensaje);
        Navigator.popAndPushNamed(context, "/Login");
      }
      if (validacion == "OK") {
        final row = response["row"];
        nombreController.text = row["nombre"];
        paisController.text = row["pais"];
        ciudadController.text = row["ciudad"];
        emailController.text = row["correo"];
        direccionController.text = row["direccion"];
      }
    }
  }

  validateInfo(String nombre, String pais, String ciudad, String email, String direccion) {
    if (nombre.isEmpty || email.isEmpty || pais.isEmpty || ciudad.isEmpty || direccion.isEmpty) {
      return "Completar todos los campos.";
    }
    return "S";
  }

  updateData(String nombre, String pais, String ciudad, String email, String direccion) async {
    Map<String, dynamic> response = await ProfileService.updateInformation(id: GlobalVariables.user, nombre: nombre, pais: pais, ciudad: ciudad, direccion: direccion, correo: email);
  }
}
