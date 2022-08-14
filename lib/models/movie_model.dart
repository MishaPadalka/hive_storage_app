import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final bool addedToWatchList;

  const Movie({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.addedToWatchList,
  });

  Movie copyWith({
    String? id,
    String? name,
    String? imageUrl,
    bool? addedToWatchList,
  }) {
    return Movie(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      addedToWatchList: addedToWatchList ?? this.addedToWatchList,
    );
  }
  @override

  List<Object?> get props => [id, name, imageUrl, addedToWatchList];
}
