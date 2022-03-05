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
          title: Text("${widget.movie.name}"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 250,height: 400,child: Image.asset("images/${widget.movie.img}")),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${widget.movie.imdb}",
                        style: const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 19)),
                    Icon(Icons.star,color: Colors.amber,)
                  ],
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    child: Text("Watch it"),
                    onPressed: () {
                      print("You are watching ${widget.movie.name}!");
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
