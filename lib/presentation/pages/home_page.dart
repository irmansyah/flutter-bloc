import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_movie/logic/blocs/blocs.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many timessss:',),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            _movieBlocConsumer(),
            _personBlocConsumer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  _movieBlocConsumer() => 
    BlocConsumer<MovieBloc, MovieState>(
      listener: (context, state) {
        if (state is MovieLoaded) {
        }
      },
      builder: (context, state) {
        print(state);
        if (state is MovieEmpty) {
          return Text('No Movie');
        }
        if (state is MovieLoading) {
          return CircularProgressIndicator();
        }
        if (state is MovieLoaded) {
          return Text(state.toString());
        }
        if (state is MovieError) {
          return Text(state.message);
        }
        return Text('Unimplemented state');
      },
    );

  _personBlocConsumer() => Container(
    child: BlocConsumer<PersonBloc, PersonState>(
      listener: (context, state) {
        if (state is PersonLoaded) {
          print('PersonLoaded : ${state.person.message}');
        }
      },
      builder: (context, state) {
        if (state is PersonEmpty) {
          return Text('No Person');
        }
        if (state is PersonLoading) {
          return CircularProgressIndicator();
        }
        if (state is PersonLoaded) {
          return Text(state.person.data.length.toString());
        }
        if (state is PersonError) {
          return Text(state.message);
        }
        return Text('Unimplemented state');
      },
    ),
  );
}