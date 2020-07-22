import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Container>[
            Container(
              width: double.infinity,
              child: Image(image: NetworkImage(
                'https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg'
              ), height: 220, fit: BoxFit.cover,),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical:15,horizontal: 30),
              child: Row(children: <Widget>[
                Expanded(
                  child: Column(children: <Widget>[
                    Text('Manantial del Hoeste', style: _stiles['Title'],),
                    SizedBox(height: 7.0,),
                    Text('Lago en Noruega')
                  ], crossAxisAlignment: CrossAxisAlignment.start,),
                ),
                Icon(Icons.star, color: Colors.red[700], size: 30,),
                Text('30')
              ],),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              child: Row(children: <Widget>[
                _column(icon: Icons.call, name: 'Call'),
                _column(icon: Icons.near_me, name: 'Route'),
                _column(icon: Icons.share, name: 'Share'),
              ], mainAxisAlignment: MainAxisAlignment.spaceEvenly ),
            ),
            Container(child: Text(_parrafo, style: _stiles['parrafo'], textAlign: TextAlign.justify,),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            Container(child: Text(_parrafo, style: _stiles['parrafo'], textAlign: TextAlign.justify,),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            Container(child: Text(_parrafo, style: _stiles['parrafo'], textAlign: TextAlign.justify,),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            )
          ],
        
        ),
      ),
    );
  }

  final Map<String, TextStyle> _stiles ={
    'Title': TextStyle(
      fontWeight: FontWeight.bold,
      wordSpacing: 5,
      fontSize: 20,
    ),
    'Subtitle': TextStyle(
      color: Colors.grey[600],
      fontSize: 18,
    ),
    'share': TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.blue[600],
      fontSize: 18,
    ),
    'parrafo': TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 16
    )
  };

  Column _column({IconData icon, String name})=>Column(
    children: <Widget>[
      Icon(icon, color: Colors.blue[600], size: 35,),
      SizedBox(height: 7.0,),
      Text(name.toUpperCase(),style: _stiles['share'],)
    ],
  );

  final _parrafo = 'Ut cupidatat eiusmod ut esse aute consectetur do reprehenderit ipsum dolore minim. Magna excepteur sint dolor ut eiusmod. Consectetur nostrud ad consectetur id anim occaecat amet consequat do dolor. Non officia veniam sit aliquip magna enim. Magna ea sit tempor exercitation culpa esse ut sunt cupidatat elit ex Lorem esse amet. Duis commodo eiusmod amet commodo nisi labore.';
}