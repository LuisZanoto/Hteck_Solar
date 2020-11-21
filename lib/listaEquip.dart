import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'model/equipamento.dart';


class ListaEquipa extends StatefulWidget {
  @override
  _ListaEquipaState createState() => _ListaEquipaState();
}

class _ListaEquipaState extends State<ListaEquipa> {


 var db = FirebaseFirestore.instance;

  //Lista Dinâmica de objetos da classe Equipamento
  List<Equipamento> equi = List();

  //Declaração de um objeto "ouvinte" da coleção Equipamentos do Firestore
  StreamSubscription<QuerySnapshot> ouvidor;

  @override
  void initState(){
    super.initState();

    //Registrar o "ouvidor" para monitorar qualquer tipo de alteração
    //na coleção Equipamentos do FireStore
    ouvidor?.cancel();

    ouvidor = db.collection("equipamentos").snapshots().listen( (res) {

      setState(() {
        equi = res.docs.map((e) => Equipamento.fromMap(e.data(), e.id)).toList();
      });

    });


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Equipamentos:"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),


      body: StreamBuilder<QuerySnapshot>(

        stream: db.collection("equipamentos").snapshots(),
        builder: (context,snapshot){

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: Text("Erro ao conectar no Firebase"));
            case ConnectionState.waiting:  
              return Center(child: CircularProgressIndicator());
            default: return ListView.builder(
                itemCount: equi.length,
                itemBuilder: (context,index){

                  return ListTile(
                    leading: Icon(Icons.devices_other), 
                    title: Text(equi[index].nome, style: TextStyle(fontSize: 24)),
                    subtitle: Text(equi[index].serial, style: TextStyle(fontSize: 18)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){

                        //Apagar o documento selecionado
                        db.collection("equipamentos").doc(equi[index].id).delete();

                      },
                    ),

                    onTap: (){

                      //Abrir a tela de Cadastro passando o ID
                      //do documento como parâmetro  
                      Navigator.pushNamed(
                        context, '/tela_cad_equip',
                        arguments: equi[index].id
                      );

                    }

                  );

                }
            );

          }
        }

      ),



      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        elevation: 0,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "/tela_cad_equip", arguments: null);
        },
      ),
      backgroundColor: Colors.blue[50],
    );
  }
}