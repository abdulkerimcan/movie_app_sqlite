import 'package:movie_app/Categories.dart';
import 'package:movie_app/Directors.dart';

import 'DatabaseHelper.dart';
import 'Movie.dart';

class MoviesDao {
  Future<List<Movie>> getAllMoviesByCategoryID(category_id) async {
    var db = await DatabaseHelper.databaseAccess();

    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM movies,categories,directors WHERE movies.category_id = categories.category_id AND movies.director_id = directors.director_id AND movies.category_id = $category_id ");

    return List.generate(maps.length, (index) {
      var row = maps[index];

      var c = Categories(row["category_id"], row["category_name"]);
      var d = Directors(row["director_id"],row["director_name"]);
      var m = Movie(row["movie_id"],row["movie_name"],row["movie_year"],row["movie_img"],c,d);

      return m;
    });
  }
}
