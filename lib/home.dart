import 'package:flutter/material.dart';

class TelaHome extends StatefulWidget {
  @override
  _TelaHomeState createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Status Atual:')),
      body: Center(
        child: RaisedButton(
          textColor: Colors.white,
          color: Colors.deepPurpleAccent,
          child: Text("Menu"),
          onPressed: (){
              Navigator.pop(context);
          },          
          
          ),        
        
      ),
      
    );
  }
}