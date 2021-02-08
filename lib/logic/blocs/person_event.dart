part of 'person_bloc.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();
}

class GetPersonList extends PersonEvent {

  const GetPersonList();

  @override
  List<Object> get props => [];
}
