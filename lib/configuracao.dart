import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'model/equipamento.dart';



class TelaConfiguracao extends StatefulWidget {
  @override
  _TelaConfiguracaoState createState() => _TelaConfiguracaoState();
}

class _TelaConfiguracaoState extends State<TelaConfiguracao> {




  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text("Configurações:")),
      body: Container( 
        padding: EdgeInsets.all(20), // espaçamento geral
        //color: Colors.green[100],
        child: ListView( 
          children:[ 

            //Text("Menu", style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),               
 

              ListTile(
              hoverColor: Colors.blue[400],
              leading: Icon(Icons.double_arrow),    
              title: Text('Lista de Equipamentos', style: TextStyle(fontSize: 20)),
              trailing: Icon(Icons.devices_other),
              onTap: (){
                Navigator.pushNamed(context, '/tela_Lista_equip');
              },
            ), 

            ListTile(
              hoverColor: Colors.blue[400],
              leading: Icon(Icons.double_arrow),    
              title: Text('Menu', style: TextStyle(fontSize: 20)),
              trailing: Icon(Icons.login),
              onTap: (){
                Navigator.pop(context);
              },
            ),        

         ],  
        
        ),
      )
      
    );
  }
}