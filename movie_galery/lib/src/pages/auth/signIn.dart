import 'package:movie_galery/src/utils/colors_sring.dart';
import 'package:movie_galery/src/utils/words_string.dart';
import 'package:movie_galery/src/utils/AuthService.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  AuthService _auth = AuthService();
  GetWords _getWords = GetWords();

  Map<String, dynamic> _errorsController = {
    'mail' : [false, ''],
    'pass' : [false, '']
  };

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        _background(),
        _body(_screenSize)
      ],)
    );
  }
  
  Container _background() =>Container(
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

  SafeArea _body(Size size) => SafeArea(
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
            children: <Widget>[
              Container(
                height: size.height * 0.2,
                alignment: Alignment.centerLeft,
                child: Text('Movie Application', style: Theme.of(context).textTheme.headline3,),
              ),
              _field(_emailController, 'mail', Icons.mail),
              Divider(
                height: size.height * 0.05,
                indent: 1000,
                endIndent: 1000,
              ),
              _field(_passwordController, 'pass', Icons.lock),
              Divider(
                height: size.height * 0.12,
                indent: 1000,
                endIndent: 1000,
              ),
              _button(size, context)
            ],
          ),
        ),
      ),
    ),
  );  

  Container _field(TextEditingController contr, String word, IconData icon) => Container(
    child:TextField(    
      controller: contr,
      obscureText: word == 'mail' ? false : true,
      keyboardType: word == 'mail' ? TextInputType.emailAddress : TextInputType.multiline,
      onChanged: (value) => setState(() {
        word == 'mail' ? _auth.setMail = value : _auth.setPass = value;
      }),
      textCapitalization: TextCapitalization.none,
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
          word == 'mail' ? _auth.setMail = '' : _auth.setPass = '';
          contr.clear();
        }) : null,
        prefixIcon: Icon(icon)),     
    )
  );
 
  Container _button(Size size, BuildContext cont) => Container(
    child: Column(
      children: <Widget>[
        GestureDetector(
          child:Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.05, horizontal: size.width*0.12),
            padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
            child: Center(
              child: Text( _getWords.getWord(value: 'signIn'), style: TextStyle(color: Colors.white, fontSize: Theme.of(cont).textTheme.headline5.fontSize),)
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
            Map<String,List<String>> checkError =_auth.signInAuth(_getWords);
            print(checkError);
            checkError['badEntry'][0] == 'mailPass'? _errorsController['mail'] = [true, checkError['badEntry'][1]]:
              checkError['mail'][0] == 'mail' ? _errorsController['mail'] = [true, checkError['mail'][1]]:
              _errorsController['mail'] = [false, ''];
            
            checkError['badEntry'][0] == 'mailPass'? _errorsController['pass'] = [true, checkError['badEntry'][1]]:
              checkError['pass'][0] == 'pass' ? _errorsController['pass'] = [true, checkError['pass'][1]]:
              _errorsController['pass'] = [false, ''];
            setState(() { });
          },
        ),                    
        Center(
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontWeight: FontWeight.w900,color: getConfigColor(color: 'label')),
              children: <TextSpan>[
                TextSpan(text: _getWords.getWord(value: 'signUp1')),
                TextSpan(
                  text: _getWords.getWord(value: 'signUp2'),style: TextStyle(color: getConfigColor(color: 'main_theme')),
                  recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(cont, '/signUp');
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
