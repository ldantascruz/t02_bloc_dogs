import 'package:bloc_dogs/models/dog.dart';

abstract class HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateEmpty extends HomeState {}

class HomeStateSuccess extends HomeState {
  final DogImage dogImage;

  HomeStateSuccess({required this.dogImage});
}

class HomeStateError extends HomeState {}
