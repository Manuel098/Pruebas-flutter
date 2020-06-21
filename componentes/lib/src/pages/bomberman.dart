import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bomberman extends StatefulWidget {
  Bomberman({Key key}) : super(key: key);

  @override
  _BombermanState createState() => _BombermanState();
}

class _BombermanState extends State<Bomberman> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _long;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bomberman'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.broken_image),
          onPressed: () => shouAlert(cont: context)),
    );
  }

  void shouAlert({BuildContext cont}) {
    showDialog(
        context: cont,
        builder: (cont) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: Text('Iteracion'),
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: '¿Cual es la longitud?',
                      labelText: 'longitud del arreglo',
                      helperText: 'Ingerese la longitud',
                      suffixIcon: Icon(Icons.people),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (Validations().number(value: value) == 0) {
                        _long = int.parse(value);
                        return null;
                      } else {
                        return Validations().number(value: value);
                      }
                    },
                  ),
                ],
              ),
              key: _formKey,
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Map<List, List> asd = {};
                    if (_formKey.currentState.validate()) {
                      List mapa = [];
                      for (int a = 0; a < _long; a++) {
                        mapa..add(a);
                      }
                      print('la longitud es de: $_long');
                      print(mapa);
                      print(asd);
                    }
                  },
                  child: Text('Continuar')),
              FlatButton(
                  onPressed: () => Navigator.of(cont).pop(),
                  child: Text('Salir')),
            ],
          );
        });
  }
}

class Validations {
  number({String value}) {
    if (value.isEmpty) {
      return 'Por favor no deje el campo vacío';
    } else {
      try {
        int asd = int.parse(value);
        if (asd > 0) {
          return 0;
        } else {
          return 'Por favor ingrese un numero positivo';
        }
      } catch (e) {
        return 'Por favor ingrese un numero';
      }
    }
  }

  monthMan({double a, int klocs, double b}) => (a * pow(klocs, b));

  timeDev({double c, double eI, double d}) => (c * pow(eI, d));
}
