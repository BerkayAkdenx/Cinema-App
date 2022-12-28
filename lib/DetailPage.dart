import 'package:cinema_app/Movies.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  Movies movie;

  DetailPage(this.movie);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.movieName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("Images/${widget.movie.movieImageName}"),
            Text("${widget.movie.moviePrize}  \u{20BA}",
                style: TextStyle(fontSize: 48, color: Colors.blue)),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    print("${widget.movie.movieName}");
                  },
                  child: Text("Buy")),
            )
          ],
        ),
      ),
    );
  }
}
