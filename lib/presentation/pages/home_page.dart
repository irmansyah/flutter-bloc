import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_movie/logic/blocs/movie_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            BlocConsumer<MovieBloc, MovieState>(
              listener: (context, state) {
                if (state is MovieLoaded) {
                  print(state.movie);
                }
                print('bloc listener $state');
              },
              builder: (context, state) {
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
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}