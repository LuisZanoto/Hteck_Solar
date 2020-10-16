import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';



class TelaConfiguracao extends StatefulWidget {
  @override
  _TelaConfiguracaoState createState() => _TelaConfiguracaoState();
}

class _TelaConfiguracaoState extends State<TelaConfiguracao> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text("Configurações:")),
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