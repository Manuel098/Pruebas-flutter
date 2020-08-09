import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

class UsersProvider{
  DatabaseReference _ref = FirebaseDatabase.instance.reference().child('Useres');
  
  Future<List<dynamic>> getUsers() async{
    final DataSnapshot data = await _ref.once();

    print(data.value['-MEGsvKXL3dmNub3pfkg']['asd']);
    
    return [1,2,3];
  }

  signUp(String mail,String password, String user) async{
    try{
      final DataSnapshot data = await _ref.orderByChild('mail').equalTo(mail).once();
      if(data.value == null){
        await _ref.push().set({ 
          'mail': mail,
          'password' : password,
          'user': user
        });
        return true;
      }else{
        return false;
      }
    }catch(e){
      print(e);
    }
    return false;
  }

  signIn(String mail,String password) async{
    try{
      final DataSnapshot data = await _ref.orderByChild('mail').equalTo(mail).once();
      bool res = false;
      data.value.forEach((key, item) {
        res = item['password'] == password ? true : false;
      });
      return res;
    }catch(e){
      print(e);
    }
    return false;
  }

}