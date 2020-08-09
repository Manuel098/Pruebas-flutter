import 'package:movie_galery/src/providers/users_provider.dart';

import './words_string.dart';
import 'package:flutter/material.dart';

class AuthService {
  String username = '', mail = '', userPass = '', verificationPass='';
  
  Map<String,List<String>> _onErr={
    'verPass':['null','200'],
    'mail':['null', '200',],
    'pass':['null','200'],
    'user':['null','200'],
    'badEntry' : ['null','200']
  };
  BuildContext cont;

  set setVerPass(String verification){
    verificationPass = verification;
  }
  set setCont(BuildContext context){
    cont = context;
  }
  set setUser(String setUser){
    username = setUser;
  }
  set setMail(String email){
    mail = email;
  }
  set setPass(String pass){
    userPass = pass;
  }

  Map<String,List<String>> signInAuth(GetWords word) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(mail);
    // Email Validation
    mail.length <= 0 ? _onErr['mail'] = ['mail', word.getWord(value: 'emptyEmail')] : emailValid == false ?
      _onErr['mail'] = ['mail', word.getWord(value: 'badEmail')]   : _onErr['mail'] =['null', '200'];

    // Password Validation
    userPass.length == 0 ? _onErr['pass'] = ['pass', word.getWord(value: 'emptyPass')] : userPass.length < 8 ?
    _onErr['pass'] = ['pass', word.getWord(value: 'lengthPass')] : _onErr['pass'] =['null', '200'];
    
    if(_onErr['mail'][0] == 'null' && _onErr['pass'][0] == 'null' ){
      _onErr['badEntry'] = ['mailPass', word.getWord(value: 'badAccess')];
      _onAuth('signIn', word);
      return _onErr;
    }
    return _onErr;
  }

  Map<String,List<String>> signUpAuth(GetWords word) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(mail);
    
    // User Validation
    username.length <= 0 ? _onErr['user'] = ['user', word.getWord(value: 'emptyUser')] : _onErr['user'] =['null', '200'];
    
    // Email Validation
    mail.length <= 0 ? _onErr['mail'] = ['mail', word.getWord(value: 'emptyEmail')] : emailValid == false ?
      _onErr['mail'] = ['mail', word.getWord(value: 'badEmail')]   : _onErr['mail'] =['null', '200'];

    // Password Validation
    userPass.length == 0 ? _onErr['pass'] = ['pass', word.getWord(value: 'emptyPass')] : userPass.length < 8 ?
    _onErr['pass'] = ['pass', word.getWord(value: 'lengthPass')] : _onErr['pass'] =['null', '200'];
    
    // Verification of password
    if(_onErr['pass'][0] == 'null'){
      if (userPass != verificationPass){
        _onErr['pass'] =['pass', word.getWord(value: 'unequalPass')];
        _onErr['verPass'] =['verPass', word.getWord(value: 'unequalPass')];
      }else{
        _onErr['pass'] = ['null', '200'];
        _onErr['verPass'] = ['null', '200'];
      }
    }

    if( _onErr['mail'][0] == 'null' && _onErr['pass'][0] == 'null' && 
      _onErr['verPass'][0] == 'null' && _onErr['user'][0] == 'null' ){
      
      _onErr['badEntry'] = ['mailPass', word.getWord(value: 'badAccess')];
      _onAuth('signUp', word);
    }
    return _onErr;

  }

  _onAuth(String prosses, GetWords word) async {
    if(prosses == 'signUp'){
      final val = await UsersProvider().signUp(mail, userPass, username);

      if( val ){
        _onErr['badEntry'] =['null', '200'];
        Navigator.pushNamed(cont, '/home');
      }
    }else{
      final val = await UsersProvider().signIn(mail, userPass);
      
      if( val ){
        _onErr['badEntry'] =['null', '200'];
        Navigator.pushNamed(cont, '/home');
      }
    }
    return _onErr;
  }
}

