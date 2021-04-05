import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_movie/data/entities/entities.dart';
import 'package:flutter_bloc_movie/data/repositories/repositories.dart';

part 'simple_event.dart';

part 'simple_state.dart';

class SimpleBloc extends Bloc<SimpleEvent, SimpleState> {
  final SimpleRepository _simpleRepository;

  SimpleBloc({
    required SimpleRepository simpleRepository,
  })   : assert(simpleRepository != null),
        _simpleRepository = simpleRepository,
        super(SimpleLoading());

  @override
  Stream<SimpleState> mapEventToState(
    SimpleEvent event,
  ) async* {
    if (event is GetPersonList) {
      yield* _mapGetPersonListToState(event);
    }
    if (event is GetJobList) {
      yield* _mapGetJobListToState(event);
    }
    if (event is GetPersonJobList) {
      yield* _mapGetPersonJobListToState(event);
    }
  }

  Stream<SimpleState> _mapGetPersonListToState(GetPersonList event) async* {
    yield SimpleLoading();
    try {
      List<PersonCarouselEntity> carouselEntity =
          await _simpleRepository.getPersonCarouselList();
      yield SimpleLoaded(baseEntities: carouselEntity);
    } catch (_) {
      yield SimpleError(message: 'Unable to fetch person');
    }
  }

  Stream<SimpleState> _mapGetJobListToState(GetJobList event) async* {
    yield SimpleLoading();
    try {
      List<JobListViewEntity> entities = await _simpleRepository.getJobList();
      yield SimpleLoaded(baseEntities: entities);
    } catch (_) {
      yield SimpleError(message: 'Unable to fetch job');
    }
  }

  Stream<SimpleState> _mapGetPersonJobListToState(SimpleEvent event) async* {
    yield SimpleLoading();
    try {
      List<BaseEntity> entity = await _simpleRepository.getList();
      yield SimpleLoaded(baseEntities: entity);
    } catch (e) {
      yield SimpleError(message: 'Unable to find job : ${e}');
    }
  }
}
