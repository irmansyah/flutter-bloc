import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_movie/data/entities/entities.dart';
import 'package:flutter_bloc_movie/logic/blocs/blocs.dart';

import '../../logic/blocs/blocs.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      // body: Column(
      //   children: [
      //     _personBlocConsumer(),
      //     _jobBlocConsumer(),
      //   ],
      // ),
      body: _listBlocConsumer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SimpleBloc>().add(GetPersonJobList());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  _listBlocConsumer() => BlocConsumer<SimpleBloc, SimpleState>(
        listener: (context, state) {
          if (state is SimpleLoaded) {}
        },
        builder: (context, state) {
          if (state is SimpleEmpty) {
            return Text('No Person');
          }
          if (state is SimpleLoading) {
            return CircularProgressIndicator();
          }
          if (state is SimpleLoaded) {
            return _personListView(state);
          }
          if (state is SimpleError) {
            return Text(state.message);
          }
          return Text('Unimplemented state');
        },
      );

  _personBlocConsumer() => BlocConsumer<SimpleBloc, SimpleState>(
        listener: (context, state) {
          if (state is SimpleLoaded) {}
        },
        builder: (context, state) {
          if (state is SimpleEmpty) {
            return Text('No Person');
          }
          if (state is SimpleLoading) {
            return CircularProgressIndicator();
          }
          if (state is SimpleLoaded) {
            return _personListView(state);
          }
          if (state is SimpleError) {
            return Text(state.message);
          }
          return Text('Unimplemented state');
        },
      );

  _jobBlocConsumer() => BlocConsumer<SimpleBloc, SimpleState>(
        listener: (context, state) {
          if (state is SimpleLoaded) {}
        },
        builder: (context, state) {
          if (state is SimpleEmpty) {
            return Text('No Person');
          }
          if (state is SimpleLoading) {
            return CircularProgressIndicator();
          }
          if (state is SimpleLoaded) {
            return _jobListView(state);
          }
          if (state is SimpleError) {
            return Text(state.message);
          }
          return Text('Unimplemented state');
        },
      );

  _personListView(state) => Container(
        child: ListView.builder(
            itemCount: state.baseEntities.length,
            itemBuilder: (context, index) {
              BaseEntity entity = state.baseEntities[index];
              if (entity is PersonCarouselEntity) {
                return Text(entity.name);
              } else if (entity is JobListViewEntity) {
                return buildPersonItem(entity.name);
              } else {
                return Text("Unimplemented Widget");
              }
            }),
      );

  _jobListView(state) => Container(
        color: Colors.amber,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: state.baseEntities.length,
            itemBuilder: (context, index) {
              BaseEntity entity = state.baseEntities[index];
              if (entity is PersonCarouselEntity) {
                return Text(entity.name);
              } else if (entity is JobListViewEntity) {
                return buildJobItem(entity.name);
              } else {
                return Text("Unimplemented Widget");
              }
            }),
      );

  Widget buildPersonItem(String name) {
    return Container(
      padding: EdgeInsets.all(16),
      color: randomColor,
      child: Text("List $name"),
    );
  }

  Widget buildJobItem(String name) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.blue,
      child: Text(name),
    );
  }

  Color get randomColor {
    List<Color> colors = [
      Colors.lime,
      Colors.redAccent,
      Colors.lightBlue,
      Colors.greenAccent,
      Colors.pink,
      Colors.green,
      Colors.lime,
      Colors.purple,
      Colors.yellow
    ];
    return colors[Random().nextInt(colors.length)];
  }
}
