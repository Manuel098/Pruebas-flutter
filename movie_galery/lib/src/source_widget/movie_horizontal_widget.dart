import 'package:flutter/material.dart';
import 'package:movie_galery/src/models/movie_model.dart';

class HorizontalMovies extends StatelessWidget {
  final List<Movie> movies;

  final Function nextPage;
  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );

  HorizontalMovies({@required this.movies, @required this.nextPage});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent-200){
        nextPage();
      }
    });

    return Container(
      height: _screenSize.height * 0.25,
      child: PageView.builder(
        controller: _pageController,
        itemCount: movies.length,
        itemBuilder: (BuildContext contex, int item) => _makeTarjet(
          context: context, movie: movies[item], height: _screenSize.height
        ),
        // children: _tarjets(_screenSize.height, context),
      ),
    );
  }

  GestureDetector _makeTarjet({@required BuildContext context, @required Movie movie, @required double height}) {
    movie.uniqueId = '${movie.id}-horizontalList';
    final tarjet = Container(
      margin: EdgeInsets.only(right:5.0),
      child: Column(
        children: <Widget>[
          Hero(
            tag: movie.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/loading.gif'), 
                image: NetworkImage(movie.getPosterImg()),
                fit: BoxFit.cover,
                height: height * 0.20,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:5),
            child: Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            ),
          )
        ],
      ),
    );

    return GestureDetector(
      child: tarjet,
      onTap: (){
        Navigator.pushNamed(context, '/info', arguments: movie);
      },
    );
  }
}