import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_movie/data/models/models.dart';
import 'package:flutter_bloc_movie/data/repositories/repositories.dart';
import 'package:meta/meta.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {

  final PersonRepository _personRepository;

  PersonBloc({
    @required PersonRepository personRepository,
    }) : assert(personRepository != null),
        _personRepository = personRepository,
        super(PersonLoading());

  @override
  Stream<PersonState> mapEventToState(
    PersonEvent event,
  ) async* {
    if (event is GetPersonList) {
      yield* _mapGetPersonListToState(event);
    }
  }

  Stream<PersonState> _mapGetPersonListToState(GetPersonList event) async* {
    yield PersonLoading();
    try {
      final Person person = await _personRepository.getPersonList();
      yield PersonLoaded(person: person);
    } catch (_) {
      yield PersonError(message: 'Unable to fetch person');
    }
  }
}
