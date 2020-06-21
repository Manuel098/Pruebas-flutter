import 'dart:ffi';

import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlide = 150;
  bool _withMortCheck = false, _blockCheck = false, _onlyMorty = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Slider Page'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              _makeSlider(),
              Expanded(child: _makeImage()),
              _makeSwitch(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('With Morty:'),
                  _withMorrty(),
                  Text('Block Slide:'),
                  _blockSlide()
                ],
              ),
            ],
          ),
        ),
      );

  Slider _makeSlider() => Slider(
        onChanged: _blockCheck
            ? null
            : (value) {
                setState(() {
                  _valueSlide = value;
                });
              },
        onChangeEnd: (value) {
          print(value);
        },
        label: 'Image Size',
        divisions: 300,
        activeColor: Colors.lightBlue[200],
        inactiveColor: Colors.indigo[100],
        value: _valueSlide,
        max: 450,
        min: 100,
      );

  Checkbox _withMorrty() => Checkbox(
      value: _withMortCheck,
      onChanged: (value) {
        setState(() {
          _withMortCheck = value;
        });
      });

  Checkbox _blockSlide() => Checkbox(
      value: _blockCheck,
      onChanged: (val) {
        setState(() {
          _blockCheck = val;
        });
      });

  _makeSwitch() => SwitchListTile(
      value: _onlyMorty,
      title: Text('Only morty'),
      onChanged: (val) {
        setState(() {
          _onlyMorty = val;
        });
      });

  Image _makeImage() => Image(
        image: NetworkImage(_onlyMorty
            ? 'https://vignette.wikia.nocookie.net/rick-y-morty-espanol/images/8/8b/Evil_morty.png/revision/latest/scale-to-width-down/340?cb=20171025215747&path-prefix=es'
            : _withMortCheck
                ? 'https://lh3.googleusercontent.com/proxy/VcpbQzk5qg1xkXKtZYoyw-y4GkR31q2_z-Mc03-N7-LeYw8Hn5HvVW2EjLo6OGij5Z5LgtpmoWcbPa1luA4UafY-H-_Oq8kref7zGnRS-u85FwGQwUc'
                : 'https://lh3.googleusercontent.com/proxy/D_HrcP7Q9oucEnQPyuFcCkhBg0_aY76evUB4IuH4BzQ7ItGhAodjA63x6MW6B-drpWSR9fXXlGr_CyHvCAgehe7T6qRbX9GOcpHZpZYRZ3mvy5R4YhuzMlNqa0RVt7XcZA'),
        width: _valueSlide,
      );
}
