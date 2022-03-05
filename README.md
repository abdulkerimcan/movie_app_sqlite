# Movie App 

An app to watch movies!

## About The Project

In this project, the movies are shown in a list. When clicking a movie ,a detailed page of the movie is shown.. 
<br> <br>
![image](https://user-images.githubusercontent.com/79968953/156896227-7a9f3799-2650-489b-ac5f-e351658eb1fd.png) <br>
 <br> <br>
I use GridView.builder with FutureBuilder. <br>
```dart
FutureBuilder<List<Food>>(
        future: getFood(),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
            var foodList = snapshot.data;
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
![image](https://user-images.githubusercontent.com/79968953/156896234-a799923d-bb44-455b-ae58-28b5831cf342.png) <br>
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

Future<List<Food>> getMovie() async {
    var movieList = <Food>[];
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



