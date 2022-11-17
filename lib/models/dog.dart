import 'dart:convert';

class DogImage {
  final String image;
  final String status;
  DogImage({
    required this.image,
    required this.status,
  });

  factory DogImage.fromMap(Map<String, dynamic> map) {
    return DogImage(
      image: map['message'] ?? '',
      status: map['status'] ?? '',
    );
  }
}
