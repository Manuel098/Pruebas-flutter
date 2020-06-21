import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: <Widget>[
          SizedBox(
            height: 35,
          ),
          _card2(),
          SizedBox(
            height: 35,
          ),
          _card1(),
          SizedBox(
            height: 35,
          ),
          _card2(),
          SizedBox(
            height: 35,
          ),
          _card1(),
          SizedBox(
            height: 35,
          ),
          _card2(),
          SizedBox(
            height: 35,
          ),
          _card1(),
          SizedBox(
            height: 35,
          ),
          _card2(),
          SizedBox(
            height: 35,
          ),
          _card1(),
          SizedBox(
            height: 35,
          ),
          _card2(),
          SizedBox(
            height: 35,
          ),
          _card1(),
          SizedBox(
            height: 35,
          ),
          _card2(),
          SizedBox(
            height: 35,
          ),
          _card1(),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }

  Card _card1() => Card(
        elevation: 8,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.photo_album,
                color: Colors.blue,
                size: 55,
              ),
              title: Text('I am the title :D'),
              subtitle: Text(
                  'Este es el subtitulo de ejemplo que se puede mostrar en cualquier ListTile pero en el tipo 1.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(onPressed: () {}, child: Text('Hola c:')),
                SizedBox(
                  width: 12,
                ),
                FlatButton(onPressed: () {}, child: Text('Adios :c'))
              ],
            )
          ],
        ),
      );

  Container _card2() {
    final _card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTXlFzwynsMusz7dprKPI4Y8V_5SAuAnMDLI6TuTidoQCDum2uc'),
            fadeInDuration: Duration(seconds: 1),
            height: 200,
            fit: BoxFit.cover,
          ),
          Container(
            child: Text(
              'No se que poner :/',
              style: TextStyle(fontSize: 20),
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
          )
        ],
      ),
    );
    return Container(
      child: ClipRRect(
        child: _card,
        borderRadius: BorderRadius.circular(30),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 4.0,
                offset: Offset(0.0, 10.0))
          ]),
    );
  }
}
