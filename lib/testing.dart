import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NateDI(),
    );
  }
}

class NateDI extends StatefulWidget {

  static GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  static TextEditingController natedi = new TextEditingController();

  @override
  _NateDIState createState() => _NateDIState();
}

class _NateDIState extends State<NateDI> {
  String nama = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Natedi")),),
      body: Column(
        children: <Widget>[
          Form(
            key: NateDI._formkey,
            child: Container(
              padding: EdgeInsets.all(40),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: NateDI.natedi,
                    validator: (value) => value.isEmpty ? 'natedi belum ketar' : null,
                  ),
                ],
              ),
            ),
          ),
          RaisedButton(
            child: Text("data"),
            onPressed: (){
              if (NateDI._formkey.currentState.validate()){
                NateDI._formkey.currentState.save();
                

                setState(() {
                  nama = NateDI.natedi.text.toString();
                });
              }
            },
          ),
          Text(nama, style: TextStyle(fontSize: 25),),
          RaisedButton(
            child: (Text("next")),
            onPressed: (){
              Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => Display(nama)
                )
              );
            },
          )
        ],
      ),
    );
  }
}


class Display extends StatelessWidget {

  final String natedi2;

  Display(this.natedi2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Text("bacaan dapat: "+natedi2),
        ),
      ),
    );
  }
}