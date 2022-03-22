# Movie App 

An app to watch movies!

## About The Project

In this project, the movies are shown in a list. When clicking a movie ,a detailed page of the movie is shown. And I pulled the directors and categories of the movies in this project from the database thanks to sqlite.
<br> <br>
![image](https://user-images.githubusercontent.com/79968953/159549558-e09aca9a-73e3-456c-afbd-87a28512f16b.png) <br>
 <br> <br>
I use GridView.builder with FutureBuilder. <br>
```dart
FutureBuilder<List<Movie>>(
        future: getMovie(),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
            var movieList = snapshot.data;
            return GridView.builder(
                .
                .
                .
                .
                .
                .
        }
```

If the data we have taken is empty, it will show a blank screen.<br>
![image](https://user-images.githubusercontent.com/79968953/159549389-e65a333f-c4ea-4a27-973f-e7907b8a55e6.png)
 <br> <br>
I created a class called Movie and kept the features(img url,name,imdb) of the movie in it. <br>

```dart
class Movie {
  String img,name;
  double imdb;

  Movie( this.name, this.img, this.imdb);
}
```


in order to retrieve the data asynchronously, I have created a Future method as follows.
```dart

Future<List<Movie>> getMovie() async {
    var movieList = <Movie>[];
    .
    .
    .
    .
    .
    .
    .
    return movieList;
  }
```


![image](https://user-images.githubusercontent.com/79968953/159549621-701381eb-bd19-4f60-89b8-cc97f2e68e40.png)
