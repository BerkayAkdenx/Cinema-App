import 'package:cinema_app/DetailPage.dart';
import 'package:flutter/material.dart';

import 'Movies.dart';

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
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Cinemas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Movies>> comeToMovies() async {
    var movieList = <Movies>[];
    var m1 = Movies(1, "Anadoluda", "anadoluda.png", 15.99);
    var m2 = Movies(2, "Django", "django.png", 15.99);
    var m3 = Movies(3, "Inception", "inception.png", 15.99);
    var m4 = Movies(4, "Interstellar", "interstellar.png", 15.99);
    var m5 = Movies(5, "The Hateful Eight", "thehatefuleight.png", 15.99);
    var m6 = Movies(6, "The Pianist", "thepianist.png", 15.99);

    movieList.add(m1);
    movieList.add(m2);
    movieList.add(m3);
    movieList.add(m4);
    movieList.add(m5);
    movieList.add(m6);
    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Movies>>(
        future: comeToMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var moviesList = snapshot.data;
            return GridView.builder(
                itemCount: moviesList!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3.5,
                ),
                itemBuilder: (context, indeks) {
                  var movie = moviesList[indeks];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(movie)));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Image.asset("Images/${movie.movieImageName}"),
                          ),
                          Text(movie.movieName,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(
                            "${movie.moviePrize} \u{20BA}",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
