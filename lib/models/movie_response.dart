import 'package:flutterdio/models/results.dart';

class MovieResponse {
  final List<Results> results;

  MovieResponse({this.results});

  MovieResponse fromJson(Map<String, dynamic> json) {
    return MovieResponse(results: parseResults(json['results']));
  }

  static List<Results> parseResults(List<dynamic> list) {
    return list.map((i) => Results.fromJson(i)).toList();
  }
}
