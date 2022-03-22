import 'package:movie_app/Categories.dart';
import 'package:movie_app/DatabaseHelper.dart';

class CategoriesDao {

  Future<List<Categories>> getCategories() async {
    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM categories");
    
    return List.generate(maps.length, (index) {
      var row = maps[index];

      return Categories(row["category_id"],row["category_name"]);
    });
  }
}