import 'package:flutter/material.dart';
import 'package:movie_galery/src/source_widget/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

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

  CardSwiper _swiperTarjet() {
    return CardSwiper(movies: [1, 2, 3, 3]);
  }
}
