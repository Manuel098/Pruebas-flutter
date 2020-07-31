import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  final PageController _pgControll = PageController();

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pgControll,
        scrollDirection: Axis.vertical,
        children: <Widget>[ _page1(), _page2(context)],
      )
    );
  }

  Stack _page1() => Stack(
    children: <Widget>[
      _backgrounColor(),
      _backgroundPicture(),
      _texts()
    ],
  );

  Stack _page2(BuildContext cont) => Stack(
    children: <Widget>[
      _backgrounColor(),
      Center(
        child: Column(children: <Widget>[
          _button(cont, 'Pagina basica', '/basic'),
          Divider(height: 50, indent: 300, endIndent: 300),
          _button(cont, 'Pagina botones', '/buttons'),
        ],mainAxisSize: MainAxisSize.min,
        ),
      ),
    ],
  );

  SafeArea _texts() => SafeArea(
    child: Column(
      children: <Widget>[
        Divider(height: 50, indent: 200, endIndent: 200,),
        Text('11°', style: _styles['Weather'],),
        Text('Miercoles', style: _styles['Title'],),
        Expanded(child: Container()),
        IconButton(icon: Icon(Icons.keyboard_arrow_down, size: 70, color: Colors.white,), onPressed: (){
          _pgControll.nextPage(duration: Duration(milliseconds: 450), curve: Curves.decelerate);
        }),
        Divider(height: 50, indent: 200, endIndent: 200,)
      ],
    ),
  );

  Container _backgrounColor() => Container(
    width: double.infinity,
    height: double.infinity,
    color: Color.fromRGBO(108, 192, 218, 1.0),
  );
  
  Container _backgroundPicture() => Container(
    width: double.infinity,
    height: double.infinity,
    child: Image(image: AssetImage('assets/scroll-1.png'), fit: BoxFit.cover,),
  );

  RaisedButton _button(BuildContext cont, String text, String route) =>  RaisedButton(
    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
    shape: StadiumBorder(),
    elevation: 5,
    color: Colors.indigo[700],
    onPressed: () => Navigator.pushNamed(cont, route),
    child: Text(text, style: _styles['Button'],),
  );
  
  final Map <String, dynamic> _styles = {
    'Weather' : TextStyle(
      color: Colors.white,
      fontSize: 50
    ),
    'Button' : TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.w300
    ),
    'Title' : TextStyle(
      color: Colors.white,
      fontSize: 55,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold
    ),
  };
}