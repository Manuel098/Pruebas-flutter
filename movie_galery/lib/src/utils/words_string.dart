import 'package:flutter/material.dart';

class GetWords{
  String lng = 'spMx';
  final _spMx = <String, String>{
    // Auth 
    'lengthPass' : 'La contraseña debe ser mayor a 8 digitos',
    'badEmail' : 'El correo no tiene formato valido',
    'badAccess' : 'La contraseña o correo son erroneos',
    'unequalPass' : 'Las contraseñas no coinciden',
    'emptyPass' : 'La contraseña esta vacia',
    'emptyEmail' : 'El correo esta vacio',
    'emptyUser' : 'El usuario esta vacio',
    'signIn1' : '¿Ya tienes una cuenta? ',
    'signUp1' : '¿No tienes una cuenta? ',
    'verPass' : 'Verificar contraseña',
    'user' : 'Nombre de usuario',
    'signIn2' : 'Inicia Sesión',
    'signUp2' : 'Registrate',
    'signIn' : 'Iniciar Sesión',
    'signUp' : 'Registrarse',
    'pass' : 'Contraseña',
    'mail' : 'Correo',
  };
  final _enUs = <String, String>{
    // Auth 
    'lengthPass' : 'The password must be length than 8 digits',
    'badEmail' : 'Mail doesn\'t have a valid format',
    'badAccess' : 'The mail or paswword are wrong',
    'unequalPass': 'Passwords doesn\'t match',
    'signUp1' : 'Don\'t you have an account? ',
    'signIn1' : 'Do you have an account? ',
    'emptyPass' : 'Password is empty',
    'emptyEmail' : 'Mail is empty',
    'emptyUser' : 'User is empty',
    'signIn2' : 'Sign In',
    'signUp2' : 'Sign Up',
    'verPass' : 'Verify password',
    'user' : 'User name',
    'signIn' : 'Sign In',
    'signUp' : 'Sign up',
    'pass' : 'Password',  //•••••••
    'mail' : 'Email',
  };
  set language(String lang){
    lng = lang;
  }
  

  String getWord({ @required String value }) =>
      lng == 'enUs' ? _enUs[value] : lng == 'spMx' ? _spMx[value] : null;
}
