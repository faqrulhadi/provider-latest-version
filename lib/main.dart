import 'package:flutter/material.dart';
import 'package:ketar_pale/userProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: User(),),
    ],
    child: MyApp()
  ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      
    );
  }
}

class LoginPage extends StatelessWidget {

  static GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  static TextEditingController natedi = new TextEditingController();


  @override
  Widget build(BuildContext context) {

  var userProv = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Login page')),
      body: Column(
        children: <Widget>[
           Form(
             key: LoginPage._formkey,
             child: Column(
               children: <Widget>[
                 Text('kangkaurt', style: TextStyle(fontSize: 20.0) ,),
                 Container(
                   padding: EdgeInsets.all(40),
                   child: TextFormField(
                     controller: LoginPage.natedi,
                      validator: (value) => value.isEmpty ? 'no text' : null,
                      onChanged: (value){
                         userProv.setNama= LoginPage.natedi.text.toString();
                      },
                   )),
                  RaisedButton(
                    child: Text('save'),
                    onPressed: (){if (LoginPage._formkey.currentState.validate()){
                      LoginPage._formkey.currentState.save();
                         userProv.setNama = LoginPage.natedi.text.toString();
                       }}),
                  Text(userProv.getNama, style: TextStyle(fontSize: 25.0),)

               ],
               
             ),
             )
       

        ],
      )
    );
  }
}

