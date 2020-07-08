import 'package:flutter/material.dart';
import 'package:movie_galery/src/models/movie_model.dart';
import 'package:movie_galery/src/providers/movies_provider.dart';

class DataSearch extends SearchDelegate{
  final MoviesProvider movProv = MoviesProvider();

  final List<String> movies=[
    'spiderman',
    'superman',
    'terminaitor',
    'tu gfa',
    'tomaya',
    'cahuate pistache',
    ' a cuanto la bolsa',
    ' a cuanto la bolsa a cuanto la bolsa a cuanto la bolsa a cuanto la bolsa'
    'terminaitorterminaitorterminaitorterminaitorterminaitorterminaitorterminaitor'
  ];

  final List<String> recentlyMovies =[
    'spiderman',
    'superman',
    'terminaitor',
    'tu gfa',
    'tomaya',
    'cahuate pistache',
    ' a cuanto la bolsa',
    ' a cuanto la bolsa a cuanto la bolsa a cuanto la bolsa a cuanto la bolsa'
  ];



  @override
  List<Widget> buildActions(BuildContext context) {
    // Modifica las acciones del AppBar
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = '';
      }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
    ), onPressed: (){
      // Navigator.of(context).pop();
      close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    // Builder que crea los resutados que mostramos
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias que aparecen cuando escribe
    Size scSize = MediaQuery.of(context).size;

    return query.isEmpty ? Container() : FutureBuilder(
      future: movProv.fetchMovies(query),
      builder: (BuildContext cont, AsyncSnapshot<List<Movie>> snaposhot){
        return snaposhot.hasData ? ListView.builder(
          itemCount: snaposhot.data.length,
          itemBuilder: (BuildContext cont, int index){
            snaposhot.data[index].uniqueId = '${snaposhot.data[index].id}-searchId';
            return Hero(
              tag: snaposhot.data[index].uniqueId,
              child: ListTile(
                leading: FadeInImage(
                  image: NetworkImage(snaposhot.data[index].getPosterImg()),
                  placeholder: AssetImage('assets/img/noImage.jpg'),
                  width: scSize.width * 0.1,
                ),
                title: Text(snaposhot.data[index].title),
                subtitle: Text(snaposhot.data[index].originalTitle),
                onTap: (){
                  Navigator.pushNamed(context, '/info', arguments: snaposhot.data[index]);
                },
              ),
            );
          }
        ): Center(child: CircularProgressIndicator());
      },
    );

    // final searchList = query.isEmpty ? recentlyMovies : movies.where(
    //   (e) => e.toLowerCase().startsWith(query.toLowerCase())
    // ).toList();

    // return ListView.builder(
    //   itemCount: searchList.length,
    //   itemBuilder: (BuildContext cont, int index){
    //     return ListTile(
    //       leading: Icon(Icons.movie),
    //       title: Text(searchList[index]),
    //       onTap: (){
    //         print(searchList[index]);
    //       },
    //     );
    //   }
    // );
  }

}