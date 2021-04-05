import 'package:flutter_bloc_movie/data/data_providers/data_providers.dart';
import 'package:flutter_bloc_movie/data/entities/entities.dart';
import 'package:flutter_bloc_movie/data/models/models.dart';

class NameRepository {
  final NameApi nameApi;

  NameRepository({required this.nameApi});

  Future<NameEntity> getNameList({required page}) async {
    Name name = await nameApi.getNameList(page: page);
    return NameMapper.nameMapper(name);
  }
}

class NameMapper {
  static NameEntity nameMapper(Name name) {
    List<Data> data = name.data!;
    List<NameItemEntity> items =
        data.map((e) => NameItemEntity(id: e.id!, name: e.name!)).toList();
    return NameEntity(nameList: items);
  }
}
