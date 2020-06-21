import 'package:flutter/material.dart';

class NewInput extends StatefulWidget {
  NewInput({Key key}) : super(key: key);

  @override
  NewInputState createState() => NewInputState();
}

class NewInputState extends State<NewInput> {
  String _name = '',
      _email = '',
      _password = '',
      _fecha = '',
      _selectedOption = 'Came Hame Ha';
  List<String> _powers = [
    'Came Hame Ha',
    'Masenko',
    'Vision de Calor',
    'Super Fuerza'
  ];

  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        children: <Widget>[
          field(),
          Divider(
            height: 45,
          ),
          _makeEmail(),
          Divider(
            height: 45,
          ),
          _makePassword(),
          Divider(
            height: 45,
          ),
          _makeDate(context: context),
          Divider(
            height: 45,
          ),
          _makeDropDown(),
          Divider(
            height: 45,
          ),
          result()
        ],
      ),
    );
  }

  TextField field() => TextField(
        onChanged: (value) {
          setState(() {
            _name = value;
          });
        },
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            counter: Text('Inicie con Mayuscula'),
            hintText: 'Nombre de la Persona',
            labelText: 'Nombre',
            helperText: 'Ingerese nombre',
            suffixIcon: Icon(Icons.people),
            icon: Icon(Icons.account_circle)),
      );

  TextField _makeEmail() => TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => setState(() {
          _email = value;
        }),
        textCapitalization: TextCapitalization.none,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: 'Correo de la Persona',
            labelText: 'Correo',
            helperText: 'Ingerese su correo',
            suffixIcon: Icon(Icons.mail),
            icon: Icon(Icons.alternate_email)),
      );

  TextField _makePassword() => TextField(
        obscureText: true,
        onChanged: (value) => setState(() {
          _password = value;
        }),
        textCapitalization: TextCapitalization.none,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: 'Contraseña de la Persona',
            labelText: 'Contraseña',
            helperText: 'Ingerese su contraseña',
            suffixIcon: Icon(Icons.lock),
            icon: Icon(Icons.lock_outline)),
      );

  TextField _makeDate({@required BuildContext context}) => TextField(
        enableInteractiveSelection: false,
        controller: _inputFieldDateController,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            hintText: 'Fecha de nacimiento',
            labelText: 'Fecha de nacimiento',
            helperText: 'Ingerese su Fecha de nacimiento',
            suffixIcon: Icon(Icons.perm_contact_calendar),
            icon: Icon(Icons.calendar_today)),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          _selectDate(context);
        },
      );

  DropdownButton _makeDropDown() => DropdownButton(
        icon: Icon(Icons.add),
        isExpanded: true,
        value: _selectedOption,
        items: getDropdownList(),
        onChanged: (obj) {
          setState(() {
            _selectedOption = obj.toString();
          });
          print(obj);
        },
      );

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1995),
        locale: Locale('es', 'ES'),
        lastDate: DateTime.now());
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  ListTile result() => ListTile(
        title: Text('Nombre: $_name'),
        subtitle: Text('Email: $_email'),
        trailing: Text(_selectedOption),
        onTap: () => print(_password),
      );

  List<DropdownMenuItem<String>> getDropdownList() {
    List<DropdownMenuItem<String>> newList = List();
    for (var power in _powers) {
      newList.add(DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    }
    return newList;
  }
}
