import 'package:flutter/material.dart';

import 'Movie.dart';

class Detail extends StatefulWidget {
  Movie movie;

  Detail(this.movie);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.movie.movie_name}"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: 250,
                  height: 400,
                  child: Image.asset("images/${widget.movie.movie_img}")),
              Text(
                "${widget.movie.directors.director_name}",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "${widget.movie.movie_year}",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ));
  }
}
