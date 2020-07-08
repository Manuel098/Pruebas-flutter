import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movie_galery/src/models/movie_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  CardSwiper({@required this.movies});
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Swiper(
        onTap: (int i){
          Navigator.pushNamed(context, '/info', arguments: movies[i]);
        },
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          movies[index].uniqueId = '${movies[index].id}-tarjet';
          return Hero(
            tag: movies[index].uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/loading.gif'), 
                image: movies[index].getPosterImg() == 'no image'?
                AssetImage('assets/img/noImage.jpg') : NetworkImage(movies[index].getPosterImg()),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        itemCount: movies.length,
        
      ),
    );
  }
}
