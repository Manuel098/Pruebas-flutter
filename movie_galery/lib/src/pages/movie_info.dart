import 'package:movie_galery/src/providers/movies_provider.dart';
import 'package:movie_galery/src/source_widget/actors_list.dart';
import 'package:movie_galery/src/models/movie_model.dart';
import 'package:flutter/material.dart';

class MovieInfo extends StatelessWidget {
  final _movProv = MoviesProvider();

  @override
  Widget build(BuildContext context) {
    final Movie mov = ModalRoute.of(context).settings.arguments;
    final Size _screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _makeAppBar( mov ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: _screenSize.height * 0.02),
              _posterTitle(mov, _screenSize, context),
              _description(mov, _screenSize, context),
              Text( 'Elenco', style: Theme.of(context).textTheme.headline5, textAlign: TextAlign.center,),
              _makeActors(mov, _screenSize, context)
            ])
          )
        ],
      )
    );
  }

  Container _posterTitle(Movie movie, Size scSize, BuildContext cont) => Container(
    padding: EdgeInsets.symmetric( horizontal:20 ),
    child: Row(
      children: <Widget>[
        Hero(
          tag: movie.uniqueId,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: NetworkImage(movie.getPosterImg()),
              height: scSize.height * 0.2,
            ),
          ),
        ),
        SizedBox(width: scSize.width * 0.03),
        Flexible(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              movie.title, 
              style: Theme.of(cont).textTheme.headline6, 
              overflow: TextOverflow.ellipsis
            ),
            Text(
              movie.originalTitle, 
              style: Theme.of(cont).textTheme.subtitle2, 
              overflow: TextOverflow.ellipsis
            ),
            Divider(height: scSize.height * 0.02, indent: 10, endIndent: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Icon(Icons.star, color: Colors.yellow[400], size: 30,),
              Text(movie.voteAverage.toString(), style: Theme.of(cont).textTheme.headline6, ),
              SizedBox(width: scSize.width * 0.05),
              Icon(Icons.perm_identity, color: Colors.blue[600], size: 30),
              Text(
                movie.popularity.toString(), 
                style: Theme.of(cont).textTheme.headline6, 
                overflow: TextOverflow.ellipsis
              ),
            ],)
          ],
        )),
      ],
    ),
  );

  FutureBuilder _makeActors(Movie mov, Size scSize, BuildContext cont) => FutureBuilder(
    future: _movProv.getActors(mov.id.toString()),
    builder: (BuildContext cont, AsyncSnapshot snapshot){
      return snapshot.hasData ? ActrosList(actors: snapshot.data,)
        : Center(child: CircularProgressIndicator(),);  
    },
  );

  Container _description(Movie mov, Size scSize, BuildContext cont) => Container(
    padding: EdgeInsets.symmetric(horizontal: scSize.width * 0.05, vertical: scSize.height*0.02),
    child: Text(mov.overview, textAlign: TextAlign.justify, style: Theme.of(cont).textTheme.bodyText2,),
  );

  SliverAppBar _makeAppBar( Movie movie ) => SliverAppBar(
    elevation: 2.0,
    backgroundColor: Colors.teal[900],
    expandedHeight: 200.0,
    floating: false,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      titlePadding: EdgeInsets.only(bottom: 0),
      title:  Text(movie.title, style: TextStyle(
        color: Colors.white, fontSize: 16,
      ), overflow: TextOverflow.ellipsis),
      background: FadeInImage(
        placeholder: AssetImage('assets/img/loading.gif'), 
        image: movie.getBackgroundImg() == 'no image'?
              AssetImage('assets/img/noImage.jpg') : NetworkImage(movie.getBackgroundImg()),
        // fadeInDuration: Duration(microseconds: 150),
        fit: BoxFit.cover,),
    ),
  );
}