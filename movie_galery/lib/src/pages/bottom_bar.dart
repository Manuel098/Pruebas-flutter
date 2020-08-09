import 'package:flutter/material.dart';
import 'dart:ui';

class BottomBarC extends StatefulWidget {
  @override
  _BottomBarCState createState() => _BottomBarCState();
}

class _BottomBarCState extends State<BottomBarC> {
  @override
    Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        _fondoApp(_screenSize),
        SafeArea(child: SingleChildScrollView(child: Column(children: <Widget>[
          _title(_screenSize),
          _roundedButtons(_screenSize)
        ])))
      ],),
      bottomNavigationBar: _bottomBar(context)
    );
  }

  Stack _fondoApp(Size screen){
    final gradient = Container(
      width: screen.width,
      height: screen.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _data['backgroundGradient'],
          begin: FractionalOffset(0.0, 0.7),
          end: FractionalOffset(0.0, 1.0)
        )
      ),
    );
    
    final pinkBox = Transform.rotate(angle: 45.0, child: Container(
      width: screen.width * 1.2,
      height: screen.height * 0.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _data['pinkGradient'], 
          end: FractionalOffset(1.0, 0.7),
          begin: FractionalOffset(0.0, 1.0)
        ),
        borderRadius: BorderRadius.circular(120)
      ),
    ));

    return Stack(children: <Widget>[
      gradient,
      Positioned(
        child: pinkBox,
        top: -130,
        left: -100,
      )
    ],);
  }

  Theme _bottomBar(BuildContext cont) => Theme(
    data: Theme.of(cont).copyWith(
      canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
      primaryColor: Colors.pinkAccent,
      textTheme: Theme.of(cont).textTheme.copyWith(
        caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0))
      )
    ), 
    child: BottomNavigationBar(items: _items,onTap: (i){
      setState(() {});
    },)
  );
  
  Container _title(Size screen) => Container(
    padding: EdgeInsets.symmetric(horizontal: screen.width * 0.05, vertical: screen.height * 0.05),
    child: Column(children: <Widget>[
    Text('Classify transaction', style: _data['titleStyle'],),
    Container(
      padding: EdgeInsets.symmetric(vertical: screen.height * 0.02),
      width: screen.width * 0.7,
      child: Text('Classify this transaction into a particular category', style: _data['containerStyle'], )
    )
  ],crossAxisAlignment: CrossAxisAlignment.start),);
  
  Table _roundedButtons(Size screen){
    return Table(
      children: [
        TableRow(children: [
          _makeRoundendButton(screen, 'General', Icons.border_all, Colors.blue[300]),
          _makeRoundendButton(screen, 'Transporte', Icons.directions_bus, Colors.purpleAccent[400])]
        ),
        TableRow(children: [
          _makeRoundendButton(screen, 'Shopping', Icons.shop, Colors.pinkAccent),
          _makeRoundendButton(screen, 'Bills', Icons.insert_drive_file, Colors.orange[400])]
        ),
        TableRow(children: [
          _makeRoundendButton(screen, 'Entertainment', Icons.movie_filter, Colors.blueAccent[400]),
          _makeRoundendButton(screen, 'Grocery', Icons.cloud_queue, Colors.green[400])]
        ),
      ],
    );
  }

  _makeRoundendButton(Size screen, String title, IconData icon, Color iconColor){
    return ClipRect(
      child: Container(
        height: screen.height * 
        0.17,
        margin: EdgeInsets.all(screen.width * 0.03),
        decoration: _data['buttonDecoration'],
        child: BackdropFilter(
          filter: ImageFilter.blur( sigmaX: 1.0, sigmaY: 1.0 ),
          child: Column(children: <Widget>[
            CircleAvatar(
              backgroundColor: iconColor,
              radius: 35,
              child: Icon(icon, color: Colors.white, size: 35,),),
            Text(title, style: TextStyle(
              wordSpacing: 8,
              color: iconColor,
              fontSize: 25,
              fontWeight: FontWeight.w300
            ))
          ], mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
        ),
      ),
    );
  }

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today), 
      title: Container()
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bubble_chart), 
      title: Container()
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.supervised_user_circle), 
      title: Container()
    ),
  ];

  final Map<String, dynamic> _data ={
    'backgroundGradient' : [
      Color.fromRGBO(52, 54, 101, 1.0),
      Color.fromRGBO(35, 37, 57, 1.0)],
    'pinkGradient' : [
      Color.fromRGBO(236, 98, 188, 1.0),
      Color.fromRGBO(241, 142, 172, 1.0)],
    'titleStyle' : TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.w400
    ),
    'containerStyle' : TextStyle(
      wordSpacing: 8,
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w300
    ),
    'buttonDecoration' : BoxDecoration(
      color: Color.fromRGBO(62, 66, 107, 0.7),
      borderRadius: BorderRadius.circular(35)
    ),
  };

}
