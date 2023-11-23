import 'package:app_shoes/components/messageDialog.dart';
import 'package:app_shoes/login/registerService.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  bool _obscureText = true;
  bool _obscureText2 = true;

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
                      decoration: const InputDecoration(
                        hintText: "Email",
                        border: InputBorder.none,
                        labelText: "Email",
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: 50,
                    color: Colors.purple.withOpacity(0.2),
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
                  Container(
                    width: 50,
                    color: Colors.purple.withOpacity(0.2),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: rePasswordController,
                      obscureText: _obscureText2,
                      decoration: InputDecoration(
                          hintText: "Repetir contraseña",
                          border: InputBorder.none,
                          labelText: "Repetir Contraseña",
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText2 ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText2 = !_obscureText2;
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
                    onPressed: () async {
                      String r = validarCampos(nombreController.text, emailController.text, passwordController.text, rePasswordController.text);
                      if (r != "S") {
                        MessageDialog.mostrar(context, "Alerta!", r);
                      } else {
                        await registrarUsuario(nombreController.text, "", "", "", emailController.text, passwordController.text, context);
                        //Navigator.pop(context);
                      }
                    },
                    child: const Text("Registrar", style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: "PTSerif")),
                  ),
                  const SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Volver", style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "PTSerif")),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  validarCampos(String nombre, String email, String password, String rePassword) {
    if (nombre.isEmpty || email.isEmpty || password.isEmpty || rePassword.isEmpty) {
      return "Completar todos los campos.";
    }
    if (password != rePassword) {
      return "Contraseñas distintas.";
    }
    return "S";
  }

  registrarUsuario(String nombre, String pais, String ciudad, String direccion, String email, String clave, context) async {
    Map<String, dynamic> response = await RegisterService.registrarUsuario(nombre: nombre, pais: pais, ciudad: ciudad, direccion: direccion, correo: email, clave: clave);
    if (response.containsKey('Validacion')) {
      String validacion = response["Validacion"];
      if (validacion == "Error") {
        String mensaje = response["Mensaje"];
        MessageDialog.mostrar(context, validacion, mensaje);
      }

      if (validacion == "OK") {
        MessageDialog.mostrar(context, "Mensaje", "Registro Exitoso.");
        limpiar();
      }
    }
  }

  limpiar() {
    emailController.text = "";
    nombreController.text = "";
    passwordController.text = "";
    rePasswordController.text = "";
  }
}
