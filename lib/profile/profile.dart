import 'package:app_shoes/bar/buttonBar.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController departamentoController = TextEditingController();
  TextEditingController ciudadController = TextEditingController();
  TextEditingController barrioController = TextEditingController();
  TextEditingController direccionController = TextEditingController();

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
                      decoration: const InputDecoration(hintText: "Nombre", border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: 50,
                    color: Colors.purple.withOpacity(0.2),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: departamentoController,
                      decoration: const InputDecoration(hintText: "Departamento", border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: 50,
                    color: Colors.purple.withOpacity(0.2),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: ciudadController,
                      decoration: const InputDecoration(hintText: "Ciudad", border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: 50,
                    color: Colors.purple.withOpacity(0.2),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: barrioController,
                      decoration: const InputDecoration(hintText: "Barrio", border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: 50,
                    color: Colors.purple.withOpacity(0.2),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: direccionController,
                      decoration: const InputDecoration(hintText: "Dirección", border: InputBorder.none),
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
                      Navigator.pushNamed(context, "/Home");
                    },
                    child: const Text("Actualizar", style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "PTSerif")),
                  ),
                  const SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/Home");
                    },
                    child: const Text("Volver", style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "PTSerif")),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
