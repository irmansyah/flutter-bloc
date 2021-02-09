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
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SimpleRepository>(
          create: (context) => SimpleRepository(
            personApi: SimpleApi(
              httpClient: http.Client(),
            ),
          ),
        ),
        RepositoryProvider<MovieRepository>(
          create: (context) => MovieRepository(
            movieApi: MovieApi(
              httpClient: http.Client(),
            ),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SimpleBloc>(
            create: (context) => SimpleBloc(
              simpleRepository: context.read<SimpleRepository>(),
            )..add(GetPersonList()),
          ),
          BlocProvider<MovieBloc>(
            create: (context) => MovieBloc(
              movieRepository: context.read<MovieRepository>(),
            )..add(GetMovieNowPlayingList()),
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
