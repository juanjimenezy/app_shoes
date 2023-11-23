class GlobalVariables {
  // Declaración de la variable global
  static String user = "";

  // Constructor privado para evitar instancias múltiples
  GlobalVariables._();

  // Instancia única de la clase
  static final GlobalVariables _instance = GlobalVariables._();

  // Método para obtener la instancia única
  factory GlobalVariables() {
    return _instance;
  }
}

// Uso de la variable global
// Acceder a la variable global: GlobalVariables.miVariableGlobal
