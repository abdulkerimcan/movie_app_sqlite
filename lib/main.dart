import 'package:flutter/material.dart';
import 'package:movie_app/Categories.dart';
import 'package:movie_app/CategoriesDao.dart';

import 'Detail.dart';
import 'Movie.dart';
import 'MoviesPage.dart';

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

  Future<List<Categories>> getAllCategories() async {
    var categoryList = await CategoriesDao().getCategories();


    return categoryList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        leading: Icon(Icons.movie_sharp),
      ),
      body: FutureBuilder<List<Categories>>(
        future: getAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var categoryList = snapshot.data;
            return ListView.builder(
              itemCount: categoryList!.length,
              itemBuilder: (context, index) {
                var category = categoryList[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MoviesPage(categories: category)));
                  },
                  child: Card(
                    elevation: 10.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${category.category_name}",
                            style: const TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                );},
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
