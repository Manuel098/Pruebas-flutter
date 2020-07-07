import 'package:flutter/material.dart';
import 'package:movie_galery/src/providers/movies_provider.dart';
import 'package:movie_galery/src/source_widget/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  final MoviesProvider movProv = MoviesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Peliculas en Cines',
          style:
              TextStyle(color: Colors.indigo[900], fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.cyan[50],
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.indigo[900],
              ),
              onPressed: () => {})
        ],
      ),
      // body: SafeArea(child: Text('Home')),
      body: Container(
        child: Column(
          children: <Widget>[_swiperTarjet()],
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
}
