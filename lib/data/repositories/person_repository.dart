import 'package:flutter_bloc_movie/data/data_providers/data_providers.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc_movie/data/models/models.dart';

class PersonRepository {
  final PersonApi personApi;

  const PersonRepository({@required this.personApi});

  Future<Person> getPersonList() {
    return personApi.getPersonList();
  }
}