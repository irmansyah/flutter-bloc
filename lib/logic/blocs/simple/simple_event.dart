part of 'simple_bloc.dart';

abstract class SimpleEvent extends Equatable {
  const SimpleEvent();
}

class GetPersonList extends SimpleEvent {

  const GetPersonList();

  @override
  List<Object> get props => [];
}

class GetJobList extends SimpleEvent {

  const GetJobList();

  @override
  List<Object> get props => [];
}

class GetPersonJobList extends SimpleEvent {

  const GetPersonJobList();

  @override
  List<Object> get props => [];
}
