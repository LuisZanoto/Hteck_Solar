import 'package:flutter/material.dart';
//import 'package:fl_chart/fl_chart.dart';



class TelaGrafico extends StatefulWidget {
  @override
  _TelaGraficoState createState() => _TelaGraficoState();
}

class _TelaGraficoState extends State<TelaGrafico> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text('Grafico:')),
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