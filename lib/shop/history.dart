import 'package:app_shoes/components/buttonBar.dart';
import 'package:app_shoes/components/global.dart';
import 'package:app_shoes/shop/historyservice.dart';
import 'package:flutter/material.dart';

class ShopHistory extends StatefulWidget {
  const ShopHistory({super.key});

  @override
  State<ShopHistory> createState() => _ShopHistoryState();
}

class _ShopHistoryState extends State<ShopHistory> {
  List<Map<String, dynamic>> compras = [];
  String bandera = "S";

  @override
  Widget build(BuildContext context) {
    loadShop();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background1.png'), // Ruta de la imagen de fondo
            fit: BoxFit.cover, // Ajustar la imagen al tamaño del contenedor
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, // Dos elementos por fila
                      crossAxisSpacing: 8.0, // Espaciado horizontal entre elementos
                      mainAxisSpacing: 8.0, // Espaciado vertical entre elementos
                      childAspectRatio: 2),
                  itemCount: compras.length,
                  itemBuilder: (context, index) {
                    final compra = compras[index];
                    return InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.purple.withOpacity(0.2), // Hace que el fondo sea transparente
                          //border: Border.all(color: Colors.black), // Puedes agregar un borde si lo deseas
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              '${compra["Zapatoimg"]}',
                              width: 150,
                              height: 100,
                            ),
                            const SizedBox(height: 8.0),
                            Text("${compra["Zapato"]}", style: const TextStyle(color: Colors.black, fontSize: 16, fontFamily: "PTSerif")),
                            Text("Precio:  ${compra["precio"]}", style: const TextStyle(color: Colors.white, fontSize: 12, fontFamily: "PTSerif")),
                            Text("Talla:  ${compra["size"]}", style: const TextStyle(color: Colors.white, fontSize: 12, fontFamily: "PTSerif")),
                            Text("Color:  ${compra["color"]}", style: const TextStyle(color: Colors.white, fontSize: 12, fontFamily: "PTSerif")),
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
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }

  loadShop() async {
    if (bandera == "S") {
      List<Map<String, dynamic>> response = await HistoryService.shopHistory(id: GlobalVariables.user);
      setState(() {
        compras = response;
      });
    }
    bandera = "N";
  }
}
