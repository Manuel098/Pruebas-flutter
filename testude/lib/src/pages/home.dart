import 'package:flutter/material.dart';
import '../stiles.dart';

class HomePage extends StatelessWidget{
  final TextStyle title = TextStyles().title(), list = TextStyles().list();
  final Color lime = Backgrouds().lime();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lime,
        title: Text(
          'Titulo',
          style: title,
        ),
        centerTitle: true,
        elevation: 20.0,
      ),
      body: Center(
        child: Column(
          verticalDirection: VerticalDirection.down,
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text('Numero de clicks', style: list),
            Text('0', style: list)
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.accessible_forward,
          color: Colors.black54,
        ),
        elevation: 5.0,
        backgroundColor: lime,
        onPressed: (){}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}