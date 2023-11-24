// ignore_for_file: use_build_context_synchronously, unnecessary_import

import 'package:app_shoes/components/buttonBar.dart';
import 'package:flutter/material.dart';
import 'package:app_shoes/shop/catalogueservice.dart';
import 'package:flutter/rendering.dart';

class Shoe extends StatefulWidget {
  const Shoe({super.key});

  @override
  State<Shoe> createState() => _ShoeState();
}

class _ShoeState extends State<Shoe> {
  List<Map<String, dynamic>> zapatos = [];
  String bandera = "S";

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> zapato = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    loadShoe(zapato["id"]);
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
                    zapato["img"],
                  ),
                  height: 200,
                  width: 200,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }

  loadShoe(String id) async {
    if (bandera == "S") {
      List<Map<String, dynamic>> response = await CatalogueService.getAll(id: id);
      setState(() {
        zapatos = response;
      });
    }
    bandera = "N";
  }
}
