import 'package:flutter/material.dart';
import 'package:movie_app/Categories.dart';
import 'package:movie_app/Directors.dart';
import 'package:movie_app/Movie.dart';
import 'package:movie_app/MoviesDao.dart';

import 'Detail.dart';

class MoviesPage extends StatefulWidget {
  Categories categories;


  MoviesPage({required this.categories});

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {


  Future<List<Movie>> getMovie(int category_id) async {
    var movieList = await MoviesDao().getAllMoviesByCategoryID(category_id);

    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories : ${widget.categories.category_name}"),
        leading: Icon(Icons.movie_sharp),
      ),
      body: FutureBuilder<List<Movie>>(
        future: getMovie(widget.categories.category_id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var movieList = snapshot.data;
            return GridView.builder(
              itemCount: movieList!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3.5
              ),
              itemBuilder: (context, index) {
                var movie = movieList[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Detail(movie)));
                  },
                  child: Card(
                    elevation: 10.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("images/${movie.movie_img}"),
                        ),

                        Text("${movie.movie_name}",
                            style: const TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
