import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileService {
  static const String apiUrl = 'https://proyeccionhumanainternacional.com/app/api.php';

  static Future<Map<String, dynamic>> informationProfile({
    required String id,
  }) async {
    final Map<String, String> body = {
      "Action": "InformacionCuenta",
      "id": id,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'authorization': 'e1f602bf73cc96f53c10bb7f7953a438fb7b3c0a',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        if (jsonResponse.containsKey('datos') && jsonResponse['datos'] != null) {
          return jsonResponse['datos'];
        } else {
          throw 'La respuesta no contiene el atributo "datos".';
        }
      } else {
        throw 'Error en el registro. Código de estado: ${response.statusCode}\n${response.body}';
      }
    } catch (error) {
      throw 'Error al realizar la solicitud: $error';
    }
  }
}
