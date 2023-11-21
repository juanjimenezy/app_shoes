import 'package:app_shoes/components/buttonBar.dart';
import 'package:flutter/material.dart';

class ShopHistory extends StatefulWidget {
  const ShopHistory({super.key});

  @override
  State<ShopHistory> createState() => _ShopHistoryState();
}

class _ShopHistoryState extends State<ShopHistory> {
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
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Historial de compras",
                style: TextStyle(fontSize: 20, fontFamily: "PTSerif", color: Colors.white),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
