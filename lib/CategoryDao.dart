
import 'package:movies_app/Categories.dart';
import 'package:movies_app/DatabaseAssistant.dart';

class CategoryDao {

  Future<List<Categories>> allCategories() async {
    var db = await DatabaseAssistant.databaseAccess();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM kategoriler");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Categories(row["kategori_id"], row["kategori_ad"]);
    },);
  }
}