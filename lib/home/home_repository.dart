import 'package:bloc_dogs/models/dog.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  Future<DogImage> getDogs() async {
    final response = await Dio().get(
      "https://dog.ceo/api/breeds/image/random",
    );

    return DogImage.fromMap(response.data);
  }
}
