import 'package:movie_app/Categories.dart';
import 'package:movie_app/Directors.dart';

class Movie {
  int movie_id;
  String movie_name;
  int movie_year;
  String movie_img;
  Categories categories;
  Directors directors;

  Movie(this.movie_id, this.movie_name, this.movie_year, this.movie_img,
      this.categories, this.directors);
}