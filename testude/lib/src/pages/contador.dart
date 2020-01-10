import 'package:flutter/material.dart';
import '../stiles.dart';

class Counter extends StatefulWidget{
  @override
  createState() =>  _CounterState();
}

class _CounterState extends State<Counter>{
  final TextStyle _title = TextStyles().title(), _list = TextStyles().list();
  final Color _lime = Backgrouds().lime();

  int _count=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _lime,
        title: Text(
          'Titulo',
          style: _title,
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
            Text('Numero de tabs', style: _list),
            Text('$_count', style: _list)
          ],
        )
      ),
      floatingActionButton: _makeButtons(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  
  }

  Widget _makeButtons(){
    return Row(
      children: <Widget>[
        FloatingActionButton(child: Icon(Icons.block,color: Colors.black54,),
          elevation: 5.0,backgroundColor: _lime,onPressed: (){restart();}),
        FloatingActionButton(child: Icon(Icons.airline_seat_flat_angled,color: Colors.black54,),
          elevation: 5.0,backgroundColor: _lime,onPressed: (){remove();}),
        FloatingActionButton(child: Icon(Icons.accessible_forward,color: Colors.black54,),
          elevation: 5.0,backgroundColor: _lime,onPressed: (){add();}),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  void add() =>setState(()=>_count++);

  void remove() =>setState(()=>_count--);

  void restart() =>setState(()=>_count=0);

}