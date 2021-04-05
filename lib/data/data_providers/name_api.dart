import 'dart:convert';

import 'package:flutter_bloc_movie/data/models/models.dart';
import 'package:http/http.dart' as http;

class NameApi {
  static const baseUrl = 'https://nama-indo.herokuapp.com';

  final http.Client? httpClient;

  const NameApi({required this.httpClient});

  Future<Name> getNameList({required int page}) async {
    final nameUrl = Uri.parse("$baseUrl/name?page=$page");
    final http.Response response = await http.get(nameUrl);
    if (response.statusCode != 200) {
      throw Exception('Failure');
    }
    final Map<String, dynamic> nameListJson = json.decode(response.body);
    return Name.fromJson(nameListJson);
  }
}
