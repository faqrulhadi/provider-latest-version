import 'package:flutter/material.dart';

class User with ChangeNotifier{
  String _nama='';


  get getNama=>_nama;
  set setNama(String newref){
     _nama=newref;
    notifyListeners();
  }
}