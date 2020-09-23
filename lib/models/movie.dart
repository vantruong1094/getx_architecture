
import 'package:getx_demo/data/services/base_service.dart';

class Movie extends BaseObject<Movie> {
  int id;
  String title;
  String posterPath;

  Movie({this.id, this.title, this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    id: json["id"] as int,
    title: json["title"] as String,
    posterPath: json["poster_path"] as String
  );

  @override
  Movie fromJson(json) {
    return Movie.fromJson(json);
  }


}