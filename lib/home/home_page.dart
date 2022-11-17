import 'dart:developer';

import 'package:bloc_dogs/home/home_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_bloc.dart';
import 'home_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          log(state.runtimeType.toString());
        },
        builder: (context, state) {
          if (state.runtimeType == HomeStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.runtimeType == HomeStateEmpty) {
            return const Center(
              child: Text('Ainda não temos nenhum doguinho por aqui!'),
            );
          } else if (state.runtimeType == HomeStateSuccess) {
            final myState = state as HomeStateSuccess;

            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(myState.dogImage.image),
              ),
            );
          } else {
            return const Center(
              child: Text('Ops! Algo deu errado!'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<HomeBloc>().add(OnRequestNewImage()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
