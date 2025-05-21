
import 'package:movies_app/Categories.dart';
import 'package:movies_app/Directories.dart';

class Movies {
  late int movie_id;
  late String movie_name;
  late int movie_year;
  late String movie_picture;
  late Categories category;
  late Directories directory;

  Movies(this.movie_id, this.movie_name, this.movie_year, this.movie_picture,
      this.category, this.directory);
}