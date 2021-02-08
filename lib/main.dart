import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_movie/data/data_providers/data_providers.dart';
import 'package:flutter_bloc_movie/data/repositories/repositories.dart';

import 'logic/blocs/bloc_delegate.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:http/http.dart' as http;

import 'logic/blocs/blocs.dart';
import 'presentation/pages/home_page.dart';

Future main() async {
  await DotEnv.load(fileName: ".env");
  Bloc.observer = SimpleBlocObserver();

  final MovieRepository movieRepository = MovieRepository(
    movieApi: MovieApi(
      httpClient: http.Client(),
    ),
  );

  final PersonRepository personRepository = PersonRepository(
    personApi: PersonApi(
      httpClient: http.Client(),
    ),
  );
  
  runApp(
    RepositoryProvider.value(
      value: personRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PersonBloc>(
            create: (context) => PersonBloc(
              personRepository: personRepository,
            )..add(GetPersonList()),
          ),
          BlocProvider<MovieBloc>(
            create: (context) => MovieBloc(
              movieRepository: movieRepository,
            ),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
