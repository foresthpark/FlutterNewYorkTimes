import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIService {
  static final String _baseUrl = 'api.nytimes.com';
  static final String _apiKey = DotEnv().env['API_KEY'];

  Future<dynamic> fetchArticlesBySection(String section) async {
    Map<String, String> parameters = {
      'api-key': _apiKey,
    };

    Uri uri =
        Uri.https(_baseUrl, '/svc/topstories/v2/$section.json', parameters);

    try {
      http.Response response = await http.get(uri);
      print(response.body);
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data['results'][0]['title]']);

      return data;
    } catch (err) {
      print(err);
      throw Exception("Error ${err.toString()}");
    }
  }
}
