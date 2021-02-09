import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_movie/data/entities/entities.dart';
import 'package:flutter_bloc_movie/logic/blocs/blocs.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _personBlocConsumer(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SimpleBloc>().add(GetJobList());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  _movieBlocConsumer() => BlocConsumer<MovieBloc, MovieState>(
    listener: (context, state) {
      if (state is MovieLoaded) {
      }
    },
    builder: (context, state) {
      if (state is MovieEmpty) {
        return Text('No Movie');
      }
      if (state is MovieLoading) {
        return CircularProgressIndicator();
      }
      if (state is MovieLoaded) {
        return Text(state.movie.results.length.toString());
      }
      if (state is MovieError) {
        return Text(state.message);
      }
      return Text('Unimplemented state');
    },
  );

  _personBlocConsumer() => BlocConsumer<SimpleBloc, SimpleState>(
    listener: (context, state) {
      if (state is SimpleLoaded) {

      }
    },
    builder: (context, state) {
      if (state is SimpleEmpty) {
        return Text('No Person');
      }
      if (state is SimpleLoading) {
        return CircularProgressIndicator();
      }
      if (state is SimpleLoaded) {
        return ListView.builder(
          itemCount: state.baseEntities.length,
          itemBuilder: (context, index) {
            BaseEntity entity = state.baseEntities[index];
            if (entity is PersonCarouselEntity) {
              return Text(entity.name);
            } else if (entity is JobListViewEntity) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.blue, 
                child: Text(entity.name),
              );
            } else {
              return Text("Unimplemented Widget");
            }
        });
      }
      if (state is SimpleError) {
        return Text(state.message);
      }
      return Text('Unimplemented state');
    },
  );
}