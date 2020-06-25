import 'package:componentes/src/services/setingService.dart';
import 'package:flutter/material.dart';

Future shouSettingAlert(
    {@required BuildContext cont, @required HomeSeting sett}) {
  return showDialog(
      context: cont,
      builder: (cont) {
        final HomeSeting test = sett;
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text('Ajustes del textp'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _field(sett),
              Divider(
                height: 30,
              ),
              _makeDropDown(sett)
            ],
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.of(cont).pop(),
                child: Text('Continuar')),
            FlatButton(
                onPressed: () {
                  print(sett.getTitleSize);
                  print(test.getTitleSize);
                  Navigator.of(cont).pop();
                },
                child: Text('Salir')),
          ],
        );
      });
}

TextField _field(HomeSeting hoSett) => TextField(
      onChanged: (value) {
        hoSett.setTitleSize = double.parse(value);
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: 'Tamaño de la fuente',
          labelText: 'Tamaño',
          icon: Icon(Icons.format_size)),
    );

DropdownButton _makeDropDown(HomeSeting hoSett) => DropdownButton(
      icon: Icon(Icons.add),
      isExpanded: true,
      value: hoSett.getFontW,
      items: <FontWeight>[
        FontWeight.w900,
        FontWeight.w400,
        FontWeight.w300,
        FontWeight.w100
      ].map<DropdownMenuItem>((FontWeight val) {
        return DropdownMenuItem(
          child: Text(
            'Sombreado',
            style: TextStyle(fontWeight: val),
          ),
          value: val,
        );
      }).toList(),
      onChanged: (obj) {
        hoSett.setFontW = obj;
      },
    );
