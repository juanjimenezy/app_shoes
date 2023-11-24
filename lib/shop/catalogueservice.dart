import 'dart:convert';
import 'package:http/http.dart' as http;

class CatalogueService {
  static const String apiUrl = 'https://proyeccionhumanainternacional.com/app/api.php';

  static Future<List<Map<String, dynamic>>> getAll({
    required String id,
  }) async {
    final Map<String, String> body = {
      "Action": "ListadoZapato",
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
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['estado'] == 1 && responseData['datos'] != null) {
          final List<dynamic> row = responseData['datos']['row'];
          return List<Map<String, dynamic>>.from(row);
        }
      }
    } catch (error) {
      throw 'Error al realizar la solicitud: $error';
    }

    return [];
  }
}
