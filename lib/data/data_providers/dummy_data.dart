
import 'package:flutter_bloc_movie/data/entities/entities.dart';

class DummyData {

  static List<PersonCarouselEntity> getPersonList() => [
    PersonCarouselEntity(id: '11', name: 'user 11', gender: 'laki'),
    PersonCarouselEntity(id: '12', name: 'user 12', gender: 'perempuan'),
    PersonCarouselEntity(id: '13', name: 'user 13', gender: 'perempuan'),
    PersonCarouselEntity(id: '14', name: 'user 14', gender: 'laki'),
    PersonCarouselEntity(id: '15', name: 'user 15', gender: 'laki'),
  ];

  static List<JobListViewEntity> getJobList() => [
    JobListViewEntity(id: '21', name: 'user 21',),
    JobListViewEntity(id: '22', name: 'user 22',),
    JobListViewEntity(id: '23', name: 'user 23',),
    JobListViewEntity(id: '24', name: 'user 24',),
    JobListViewEntity(id: '25', name: 'user 25',),
  ];
}