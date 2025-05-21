
import 'package:movies_app/Categories.dart';
import 'package:movies_app/DatabaseAssistant.dart';
import 'package:movies_app/Directories.dart';
import 'package:movies_app/Movies.dart';

class MoviesDao {

  Future<List<Movies>> allMoviesByCategoryId(int category_id) async {
    var db = await DatabaseAssistant.databaseAccess();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM filmler,kategoriler,yonetmenler "
        "WHERE filmler.kategori_id = kategoriler.kategori_id and filmler.yonetmen_id = yonetmenler.yonetmen_id and filmler.kategori_id = $category_id");

    return List.generate(maps.length, (index) {
      var row = maps[index];

      var c = Categories(row["kategori_id"], row["kategori_ad"]);
      var d = Directories(row["yonetmen_id"], row["yonetmen_ad"]);

      var m = Movies(row["film_id"], row["film_ad"], row["film_yil"], row["film_resim"], c, d);

      return m;
    },);
  }

}