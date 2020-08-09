import 'package:flutter/material.dart';
import 'package:movie_galery/src/models/movie_model.dart';
import 'package:movie_galery/src/providers/movies_provider.dart';
import 'package:movie_galery/src/source_widget/card_swiper_widget.dart';
import 'package:movie_galery/src/source_widget/movie_horizontal_widget.dart';
import 'package:movie_galery/src/source_widget/search/search_delegate.dart';
import 'package:movie_galery/src/utils/words.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MoviesProvider movProv = MoviesProvider();

  @override
  Widget build(BuildContext context) {
    movProv.getPopulars();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Peliculas en Cines',
          style:
              TextStyle(color: Colors.cyan[50], fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.indigo[900],
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.cyan[50],
            ),
            onPressed: () => {
              showSearch(context: context, query: '', delegate: DataSearch())
            })
        ],
      ),
      
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _swiperTarjet(),
            _footer(context)
          ],
        ),
      ),
    );
  }

  FutureBuilder _swiperTarjet() {
    return FutureBuilder(
      future : movProv.getOnCinema(),
      builder : (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData ? CardSwiper(movies: snapshot.data)
          : Container(
            height : MediaQuery.of(context).size.height * 0.7,
            child : Center(
              child : CircularProgressIndicator()
            ),
          );
      },
    );
    

  }

  _footer(BuildContext cont) => Container(
    width: double.infinity,
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom:20),
          child: Text(getWord('spPopular'), style: Theme.of(cont).textTheme.subtitle1)
        ),
        StreamBuilder(
          stream: movProv.popularsStream,
          builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
              return snapshot.hasData ? HorizontalMovies(movies: snapshot.data, nextPage: movProv.getPopulars,)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ],
    ),
  );
}
