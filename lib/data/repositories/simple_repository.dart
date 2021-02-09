import 'package:flutter_bloc_movie/data/data_providers/data_providers.dart';
import 'package:flutter_bloc_movie/data/data_providers/dummy_data.dart';
import 'package:flutter_bloc_movie/data/entities/entities.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc_movie/data/models/models.dart';

class SimpleRepository {
  final SimpleApi personApi;

  const SimpleRepository({@required this.personApi});

  Future<List<PersonCarouselEntity>> getPersonCarouselList() async {
    Person person = await personApi.getPersonList();
    return Mapper.personCarouselMapper(person);
  }

  Future<List<JobListViewEntity>> getJobList() async {
    Job job = await personApi.getJobList();
    return Mapper.jobListMapper(job);
  }

  Future<List<BaseEntity>> getList() async {
    // Person person = await personApi.getPersonList();
    // Job job = await personApi.getJobList();
    // List<BaseEntity> personEntities = Mapper.personCarouselMapper(person);
    // List<BaseEntity> jobEntities = Mapper.jobListMapper(job);

    List<BaseEntity> personEntities = DummyData.getPersonList();
    List<BaseEntity> jobEntities = DummyData.getJobList();
  

    List<BaseEntity> entities = [...personEntities, ...jobEntities];
    entities.map((element) {
      print(element);
    }); 
    return entities;
  }
}

class Mapper {

  static List<PersonCarouselEntity> personCarouselMapper(Person person) {
    List<PersonData> data = person.data;
    List<PersonCarouselEntity> carousel = data.map((e) {
      return PersonCarouselEntity(id: e.id, name: e.name, gender: e.gender);
    }).toList();
    return carousel;
  }

  static List<JobListViewEntity> jobListMapper(Job job) {
    List<JobData> data = job.data;
    List<JobListViewEntity> carousel = data.map((e) {
      return JobListViewEntity(id: e.id, name: e.name);
    }).toList();
    return carousel;
  }
}