import 'package:flutter/material.dart';

import 'Detail.dart';
import 'Movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Movie>> getMovie() async {
    var movieList = <Movie>[];

    var f1 = Movie( "Interstellar", "interstellar.jpg", 9.2);
    var f2 = Movie( "Arog", "arog.jpg", 8.1);
    var f3 = Movie( "The Lord of the Rings", "lotr3.jpg", 9.8);
    var f4 = Movie( "Se7en", "seven.jpg", 8.9);
    var f5 = Movie( "Kolpaçino", "kolpacino.jpg", 6.2);
    var f6 = Movie( "Shutter Island", "shutterIsland.jpg", 8.5);
    var f7 = Movie( "Gora", "gora.jpg", 7.5);

    movieList.add(f1);
    movieList.add(f2);
    movieList.add(f3);
    movieList.add(f4);
    movieList.add(f5);
    movieList.add(f6);
    movieList.add(f7);

    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
        leading: Icon(Icons.movie_sharp),
      ),
      body: FutureBuilder<List<Movie>>(
        future: getMovie(),
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
                      children: [
                        Image.asset("images/${movie.img}"),

                        Text("${movie.name}",
                            style: const TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${movie.imdb}",
                                style: const TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 19)),
                            Icon(Icons.star,color: Colors.amber,)
                          ],
                        )
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
