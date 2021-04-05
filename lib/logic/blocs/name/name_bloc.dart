import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_movie/data/entities/entities.dart';
import 'package:flutter_bloc_movie/data/repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

part 'name_event.dart';

part 'name_state.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  final NameRepository _nameRepository;

  NameBloc({required NameRepository nameRepository})
      : _nameRepository = nameRepository,
        super(NameInitial());

  @override
  Stream<Transition<NameEvent, NameState>> transformEvents(
      Stream<NameEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(const Duration(milliseconds: 500)), transitionFn);
  }

  @override
  Stream<NameState> mapEventToState(
    NameEvent event,
  ) async* {
    final currentState = state;
    if (event is NameFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is NameInitial) {
          final nameEntity = await _nameRepository.getNameList(page: 1);
          yield NameSuccess(nameEntity: nameEntity, hasReachedMax: false);
          return;
        }
        if (currentState is NameSuccess) {
          final nameEntity =
              await _nameRepository.getNameList(page: currentState.page! + 1);
          yield nameEntity.nameList.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : NameSuccess(
                  nameEntity: NameEntity(
                      nameList: currentState.nameEntity!.nameList +
                          nameEntity.nameList),
                  hasReachedMax: false,
                );
        }
      } catch (e) {
        yield NameError(message: e.toString());
      }
    }
  }

  bool _hasReachedMax(NameState state) =>
      state is NameSuccess && state.hasReachedMax!;
}
