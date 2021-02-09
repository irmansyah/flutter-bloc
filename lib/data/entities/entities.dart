import 'package:flutter/material.dart';

abstract class BaseEntity {}

class PersonCarouselEntity extends BaseEntity {

  String id;
  String name;
  String gender;

  PersonCarouselEntity({
    @required this.id,
    @required this.name,
    @required this.gender,
  });
}

class JobListViewEntity extends BaseEntity {

  String id;
  String name;

  JobListViewEntity({
    @required this.id,
    @required this.name,
  });
}