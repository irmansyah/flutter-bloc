import 'dart:convert';

import 'package:flutter_bloc_movie/data/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class SimpleApi {
  static const baseUrl = 'https://simple-api-utsman.herokuapp.com';
  final http.Client httpClient;

  const SimpleApi({@required this.httpClient});

  Future<Person> getPersonList() async {
    final String personUrl = '$baseUrl/api/names';
    final http.Response response = await httpClient.get(personUrl);
    if (response.statusCode != 200) {
      throw Exception('Failure');
    }
    final Map<String, dynamic> personListJson = json.decode(response.body);
    return Person.fromJson(personListJson);
  }

  Future<Job> getJobList() async {
    final String jobUrl = '$baseUrl/api/job';
    final http.Response response = await httpClient.get(jobUrl);
    if (response.statusCode != 200) {
      throw Exception('Failure');
    }
    final Map<String, dynamic> jobListJson = json.decode(response.body);
    return Job.fromJson(jobListJson);
  }
}