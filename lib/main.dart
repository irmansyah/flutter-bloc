import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_movie/data/repositories/repositories.dart';
import 'package:flutter_bloc_movie/data/data_providers/movie_api.dart';
import 'package:flutter_bloc_movie/logic/blocs/movie_bloc.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'logic/blocs/bloc_delegate.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:http/http.dart' as http;

import 'presentation/pages/home_page.dart';

Future main() async {
  await DotEnv.load(fileName: ".env");
  Bloc.observer = SimpleBlocObserver();
  final movieRepository = MovieRepository(
    movieApi: MovieApi(
      httpClient: http.Client(),
    ),
  );
  runApp(
    RepositoryProvider.value(
      value: movieRepository,
      child: MultiBlocProvider(
        providers: [
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
