

abstract class BaseEntity {}

class PersonCarouselEntity extends BaseEntity {
  String id;
  String name;
  String gender;

  PersonCarouselEntity({
    required this.id,
    required this.name,
    required this.gender,
  });
}

class JobListViewEntity extends BaseEntity {
  String id;
  String name;

  JobListViewEntity({
    required this.id,
    required this.name,
  });
}

class NameEntity extends BaseEntity {
  List<NameItemEntity> nameList;

  NameEntity({required this.nameList});
}

class NameItemEntity extends BaseEntity {
  String id;
  String name;

  NameItemEntity({
    required this.id,
    required this.name,
  });
}
