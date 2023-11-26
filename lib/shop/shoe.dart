// ignore_for_file: use_build_context_synchronously, unnecessary_import

import 'package:app_shoes/components/buttonBar.dart';
import 'package:app_shoes/components/global.dart';
import 'package:app_shoes/components/messageDialog.dart';
import 'package:app_shoes/shop/shoeservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Shoe extends StatefulWidget {
  const Shoe({super.key});

  @override
  State<Shoe> createState() => _ShoeState();
}

class _ShoeState extends State<Shoe> {
  String bandera = "S";
  String selectedColor = 'Negro';
  String selectedSize = 'Seleccione Talla';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> shoe = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background1.png'), // Ruta de la imagen de fondo
            fit: BoxFit.cover, // Ajustar la imagen al tamaño del contenedor
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.purple.withOpacity(0.2),
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                      child: Image.asset(
                        shoe['img'],
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            shoe['nombre'],
                            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily: "PTSerif"),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            shoe['lema'],
                            style: const TextStyle(fontSize: 16.0, color: Colors.grey, fontFamily: "PTSerif"),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            shoe['descripcion'],
                            style: const TextStyle(fontSize: 16.0, fontFamily: "PTSerif"),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'Precio: \$${shoe['precio']}',
                            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: "PTSerif"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton<String>(
                        value: selectedSize,
                        items: <String>['Seleccione Talla', '38', '39', '40', '41'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedSize = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(width: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Colores:'),
                      const SizedBox(width: 10.0),
                      Radio(
                        value: 'Blanco',
                        groupValue: selectedColor,
                        onChanged: (value) {
                          setState(() {
                            selectedColor = value.toString();
                          });
                        },
                      ),
                      const Text('Blanco'),
                      const SizedBox(width: 12.0),
                      Radio(
                        value: 'Negro',
                        groupValue: selectedColor,
                        onChanged: (value) {
                          setState(() {
                            selectedColor = value.toString();
                          });
                        },
                      ),
                      const Text('Negro'),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        if (validarData(selectedSize)) {
                          registrarCompra(GlobalVariables.user, shoe, selectedSize, selectedColor);
                        }
                      },
                      child: const Text("Comprar", style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "PTSerif"))),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Volver", style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "PTSerif")))
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }

  validarData(String talla) {
    if (talla == "Seleccione Talla") {
      MessageDialog.mostrar(context, "Aletar!", "Seleccione la talla");
      return false;
    }
    return true;
  }

  registrarCompra(String idUser, Map<String, dynamic> shoe, String size, String color) async {
    Map<String, dynamic> response = await ShoeService.register(idUser: idUser, idZapato: shoe['id'], size: size, cantidad: "1", color: color);
    if (response.containsKey('Validacion')) {
      String validacion = response["Validacion"];
      if (validacion == "Error") {
        String mensaje = response["Mensaje"];
        MessageDialog.mostrar(context, validacion, mensaje);
      }
      if (validacion == "OK") {
        MessageDialog.mostrar(context, "Mensaje", "Compra exitosa.");
      }
    }
  }
}
