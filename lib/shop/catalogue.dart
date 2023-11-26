// ignore_for_file: use_build_context_synchronously, unnecessary_import

import 'package:app_shoes/components/buttonBar.dart';
import 'package:flutter/material.dart';
import 'package:app_shoes/shop/catalogueservice.dart';
import 'package:flutter/rendering.dart';

class Catalogue extends StatefulWidget {
  const Catalogue({super.key});

  @override
  State<Catalogue> createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  List<Map<String, dynamic>> zapatos = [];
  String bandera = "S";

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;

    loadShoes(id);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background1.png'), // Ruta de la imagen de fondo
            fit: BoxFit.cover, // Ajustar la imagen al tamaño del contenedor
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40.0),
                Image(
                  image: AssetImage(
                    'assets/img/${id}_logo.png',
                  ),
                  height: 150,
                  width: 150,
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Dos elementos por fila
                  crossAxisSpacing: 8.0, // Espaciado horizontal entre elementos
                  mainAxisSpacing: 8.0, // Espaciado vertical entre elementos
                ),
                itemCount: zapatos.length,
                itemBuilder: (context, index) {
                  final zapato = zapatos[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/Shoe", arguments: zapato);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.2), // Hace que el fondo sea transparente
                        //border: Border.all(color: Colors.black), // Puedes agregar un borde si lo deseas
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            '${zapato["img"]}',
                            width: 150,
                            height: 100,
                          ),
                          const SizedBox(height: 8.0),
                          Text(zapato["nombre"]),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }

  loadShoes(String id) async {
    if (bandera == "S") {
      List<Map<String, dynamic>> response = await CatalogueService.getAll(id: id);
      setState(() {
        zapatos = response;
      });
    }
    bandera = "N";
  }
}
