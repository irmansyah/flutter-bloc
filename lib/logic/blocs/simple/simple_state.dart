part of 'simple_bloc.dart';

abstract class SimpleState extends Equatable {
  const SimpleState();

  @override
  List<Object> get props => [];
}

class SimpleEmpty extends SimpleState {}

class SimpleLoading extends SimpleState {}

class SimpleLoaded extends SimpleState {
  final List<BaseEntity> baseEntities;

  SimpleLoaded({required this.baseEntities});

  @override
  List<Object> get props => [baseEntities];
}

class SimpleError extends SimpleState {
  final String message;

  SimpleError({required this.message});

  @override
  List<Object> get props => [message];
}
