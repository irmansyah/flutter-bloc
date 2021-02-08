part of 'person_bloc.dart';

abstract class PersonState extends Equatable {
  const PersonState();
  
  @override
  List<Object> get props => [];
}

class PersonEmpty extends PersonState {}

class PersonLoading extends PersonState {}

class PersonLoaded extends PersonState {
  final Person person;

  PersonLoaded({@required this.person});

  @override
  List<Object> get props => [person];
}

class PersonError extends PersonState {
  final String message;

  PersonError({@required this.message});

  @override
  List<Object> get props => [message];
}
