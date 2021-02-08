import 'dart:convert';

import 'package:flutter_bloc_movie/data/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class PersonApi {
  static const baseUrl = 'https://simple-api-utsman.herokuapp.com';
  final http.Client httpClient;

  const PersonApi({@required this.httpClient});

  Future<Person> getPersonList() async {
    final String personUrl = '$baseUrl/api/names';
    final http.Response response = await httpClient.get(personUrl);
    if (response.statusCode != 200) {
      throw Exception('Failure');
    }
    final Map<String, dynamic> personListJson = json.decode(response.body);
    print('Person List Json : ${personListJson.length}');
    return Person.fromJson(personListJson);
  }
}