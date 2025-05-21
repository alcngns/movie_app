
import 'package:flutter/material.dart';
import 'package:movies_app/Categories.dart';
import 'package:movies_app/DetailPage.dart';
import 'package:movies_app/Movies.dart';
import 'package:movies_app/MoviesDao.dart';

class MoviesPage extends StatefulWidget {

  late Categories category;
  MoviesPage({required this.category});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {

  Future<List<Movies>> showMovies(int category_id) async {
    var movieList = MoviesDao().allMoviesByCategoryId(category_id);
    return movieList;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Filmler : ${widget.category.category_name}"),
      ),
      body: FutureBuilder<List<Movies>>(
        future: showMovies(widget.category.category_id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var movieList = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5,
              ),
              itemCount: movieList!.length,
              itemBuilder: (context, index) {
                var movie = movieList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(movie),));
                  },
                  child: Card(
                    color: index % 2 == 0 ? Colors.blueGrey : Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("images/${movie.movie_picture}"),
                        ),
                        Text(movie.movie_name, style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                );
              },
            );
          }else {
            return Center();
          }
        },
      ),

    );
  }
}
