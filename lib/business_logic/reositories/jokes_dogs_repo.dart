import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ui_templates/core/app_strings.dart';

class JokeDogRepo {

  Future<List<dynamic>> getData() async {
    try {
      final List<dynamic> responses = await Future.wait(
        [
          http.get(
            Uri.parse(
              AppStrings.dogUrl,
            ),
          ),
          http.get(
            Uri.parse(
              AppStrings.jokesUrl,
            ),
          ),
        ],
      );
      return <dynamic>[
        extractedData(responses[0]),
        extractedData(responses[1]),
      ];
    } on SocketException {
      throw Exception('No internet from JokeDogRepo in getData');
    } catch (e) {
      throw Exception('${e.toString()} from JokeDogRepo in getData');
    }
  }

  dynamic extractedData(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }
}
