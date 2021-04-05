part of 'name_bloc.dart';

abstract class NameState extends Equatable {
  const NameState();

  @override
  List<Object> get props => [];
}

class NameInitial extends NameState {}

class NameSuccess extends NameState {
  final NameEntity? nameEntity;
  final bool? hasReachedMax;
  final int? page;

  NameSuccess({this.nameEntity, this.hasReachedMax, this.page = 1});

  NameSuccess copyWith({
    NameEntity? nameEntity,
    bool? hasReachedMax,
    int? page,
  }) {
    return NameSuccess(
      nameEntity: nameEntity ?? this.nameEntity,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [nameEntity!, hasReachedMax!];
}

class NameError extends NameState {
  final String message;

  NameError({required this.message});

  @override
  List<Object> get props => [message];
}
