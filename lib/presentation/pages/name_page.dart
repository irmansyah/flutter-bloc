import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_movie/data/entities/entities.dart';
import 'package:flutter_bloc_movie/logic/blocs/blocs.dart';

class NamePage extends StatefulWidget {
  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  late NameBloc _nameBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _nameBloc = context.read<NameBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NameBloc, NameState>(
      builder: (context, state) {
        if (state is NameInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is NameError) {
          return Center(
            child: Text('failed to fetch posts'),
          );
        }
        if (state is NameSuccess) {
          if (state.nameEntity!.nameList.isEmpty) {
            return Center(
              child: Text('no names'),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return index >= state.nameEntity!.nameList.length
                  ? BottomLoader()
                  : NameWidget(
                      nameItemEntity: state.nameEntity!.nameList[index]);
            },
            itemCount: state.hasReachedMax!
                ? state.nameEntity!.nameList.length
                : state.nameEntity!.nameList.length + 1,
            controller: _scrollController,
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    print("$maxScroll - $currentScroll");
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _nameBloc.add(NameFetched());
    }
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}

class NameWidget extends StatelessWidget {
  final NameItemEntity nameItemEntity;

  const NameWidget({required this.nameItemEntity});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nameItemEntity.name),
    );
  }
}
