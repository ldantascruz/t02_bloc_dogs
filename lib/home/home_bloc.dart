import 'dart:async';

import 'package:bloc_dogs/home/home_event.dart';
import 'package:bloc_dogs/home/home_repository.dart';
import 'package:bloc_dogs/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;
  HomeBloc({
    required this.repository,
  }) : super(HomeStateEmpty()) {
    on<OnRequestNewImage>(requestNewPhoto);
  }
  Future<void> requestNewPhoto(
    HomeEvent event,
    Emitter<HomeState> emitter,
  ) async {
    try {
      emitter(HomeStateLoading());
      final dogImage = await repository.getDogs();
      emitter(HomeStateSuccess(dogImage: dogImage));
    } catch (e) {
      emitter(HomeStateError());
    }
  }
}
