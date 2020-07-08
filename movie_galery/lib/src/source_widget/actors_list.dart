import 'package:flutter/material.dart';
import 'package:movie_galery/src/models/actors_model.dart';

class ActrosList extends StatefulWidget {
  final List<Actor> actors;
  ActrosList({Key key, @required this.actors}) : super(key: key);

  @override
  _ActrosListState createState() => _ActrosListState(actors);
}

class _ActrosListState extends State<ActrosList> {
  List<Actor> actors;

  _ActrosListState(this.actors);
  
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1
        ),
        itemCount: actors.length,
        itemBuilder: (BuildContext cont, int i) {
          Column person = Column(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/loading.gif'),
                image: actors[i].getActorImg() != 'no image'?
                  NetworkImage( actors[i].getActorImg()):AssetImage('assets/img/noImage.jpg'),
                fit: BoxFit.cover,
                height: _screenSize.height * 0.15,
              ),
            ),
            Text(actors[i].name, overflow: TextOverflow.ellipsis)
          ]);

          return Tooltip(
            message: actors[i].character,
            child: GestureDetector(
              child: person,
              onTap: (){
                print(actors[i].gender == 1? 'Mujer' : 'Hombre');
              },
            ),
          );
        },
      ),
    );
  }
}