import 'package:flutter/material.dart';
import 'package:movies_app/Movies.dart';

class DetailPage extends StatefulWidget {

  late Movies movie;
  DetailPage(this.movie);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.movie.movie_name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/${widget.movie.movie_picture}"),
            ),
            Text(widget.movie.directory.directory_name, style: TextStyle(color: Colors.black87, fontSize: 30, fontWeight: FontWeight.bold),),
            Text(widget.movie.movie_year.toString(), style: TextStyle(color: Colors.black, fontSize: 28),),
          ],
        ),
      ),

    );
  }
}
