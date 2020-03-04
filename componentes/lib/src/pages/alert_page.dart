import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert Page'),),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alert'),
          textColor: Colors.white,
          shape: StadiumBorder(),
          color: Colors.blueAccent,
          onPressed: () => shouAlert(cont: context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: (){Navigator.pop(context);},
      ),
    );
  }

  void shouAlert({BuildContext cont}){
    showDialog(context: cont, builder: (cont){
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text('Titulo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Primer parrafo de la alerta'),
            Text('Segundo parrafo de la alerta'),
            FlutterLogo(size: 100,)
          ],
        ),
        actions: <Widget>[
          FlatButton(onPressed: (){}, child: Text('Continuar')),
          FlatButton(onPressed: ()=>Navigator.of(cont).pop(), child: Text('Salir')),
        ],
      );
    });
  }
}