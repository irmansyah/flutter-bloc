part of 'name_bloc.dart';

abstract class NameEvent extends Equatable {
  const NameEvent();
  @override
  List<Object> get props => [];
}

class NameFetched extends NameEvent {
  const NameFetched();
}
