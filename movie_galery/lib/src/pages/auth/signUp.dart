import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_galery/src/utils/AuthService.dart';
import 'package:movie_galery/src/utils/words_string.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _userController = TextEditingController();

  AuthService _auth = AuthService();
  GetWords _getWords = GetWords();

  Map<String, dynamic> _errorsController = {
    'mail' : [false, ''],
    'user' : [false, ''],
    'pass' : [false, ''],
    'verPass' : [false, '']
  };

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        _background(),
        _body(_screenSize, context)
      ]),
    );
  }

  Container _background() => Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(247, 255, 255, 1.0),
          Color.fromRGBO(240, 240, 240, 1.0)],
        begin: FractionalOffset(0.0, 0.4),
        end: FractionalOffset(0.0, 1.0),
      )
    ),
    child: Image(
      image: NetworkImage('https://pm1.narvii.com/6343/1d099e8a705206aa3c44b0c53f9f44216424a790_hq.jpg'),
      fit: BoxFit.cover,
    ),
  );

  SafeArea _body(Size size, BuildContext cont) => SafeArea(
    child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.05,
        horizontal: size.width * 0.05
      ),
      child: Card(
        color: Color.fromRGBO(255, 255, 255, 0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: size.height * 0.2,
                alignment: Alignment.centerLeft,
                child: Text('Movie Application', style: Theme.of(context).textTheme.headline3,)
              ),
              _field(_userController, 'user', Icons.perm_identity),
              _field(_emailController, 'mail', Icons.mail),
              _field(_passwordController, 'pass', Icons.lock),
              _field(_confirmPasswordController, 'verPass', Icons.lock_outline),
              _button(size, cont)
            ]
          ),
        ),
      )
    )
  );

  TextField _field(TextEditingController contr, String word, IconData icon) => TextField(
    controller: contr,
    obscureText: word == 'mail' || word == 'user' ? false : true,
    keyboardType: word == 'mail' ? TextInputType.emailAddress : TextInputType.multiline,
    onChanged: (value) => setState(() {
      word == 'mail' ? _auth.setMail = value : word == 'user' ? _auth.setUser = value :
        word == 'verPass' ? _auth.setVerPass = value : _auth.setPass = value;
    }),
    textCapitalization: word == 'user' ? TextCapitalization.words :TextCapitalization.none,
    decoration: InputDecoration(
      border: OutlineInputBorder( 
        borderSide: _errorsController[word][0] == false ? 
          BorderSide.none :
          BorderSide(width: 10), 
        borderRadius: BorderRadius.circular(20)
      ),
      hintText: word == 'mail' ? 'movie@mail.com' : _getWords.getWord(value: word),
      labelText: _getWords.getWord(value: word),
      errorText: _errorsController[word][0] == false ? null : _errorsController[word][1],
      suffixIcon: contr.text.length > 0 ? IconButton(icon: Icon(Icons.clear), onPressed: (){
        word == 'mail' ? _auth.setMail = '' : word == 'user' ? _auth.setUser = '' : word == 'verPass' 
        ? _auth.setPass = '' : _auth.setPass = '';
        contr.clear();
      }) : null,
      prefixIcon: Icon(icon)),
  );

  Container _button(Size size, BuildContext cont) => Container(
    child: Column(
      children: <Widget>[
        GestureDetector(
          child:Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.05, horizontal: size.width*0.12),
            padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
            child: Center(
              child: Text( _getWords.getWord(value: 'signUp'), style: TextStyle(color: Colors.white, fontSize: Theme.of(cont).textTheme.headline5.fontSize),)
            ),
            decoration: BoxDecoration(
                color: Color(0xFF5cabff),
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF5cabff),
                      offset: Offset(6, 2),
                      blurRadius: 1.0,
                      spreadRadius: 2.0),
                ]),
          ),
          onTap: () {
            _auth.setCont = context;
            Map<String,List<String>> checkError =_auth.signUpAuth(_getWords);
            checkError['mail'][0] == 'mail' ? 
              _errorsController['mail'] = [true, checkError['mail'][1]] : 
              _errorsController['mail'] = [false, ''];
            checkError['user'][0] == 'user' ? 
              _errorsController['user'] = [true, checkError['user'][1]] : 
              _errorsController['user'] = [false, ''];
            checkError['verPass'][0] == 'verPass' ? 
              _errorsController['verPass'] = [true, checkError['verPass'][1]] : 
              _errorsController['verPass'] = [false, ''];
            checkError['pass'][0] == 'pass' ? 
              _errorsController['pass'] = [true, checkError['pass'][1]] : 
              _errorsController['pass'] = [false, ''];
            setState(() { });
          },
        ),                    
        Center(
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black54),
              children: <TextSpan>[
                TextSpan(text: _getWords.getWord(value: 'signIn1')),
                TextSpan(
                  text: _getWords.getWord(value: 'signIn2'),style: TextStyle(color: Color(0xFF5cabff)),
                  recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(cont, '/');
                  },
                )
              ]
            )
          )
        ),
      ],
    ),
  );
}
