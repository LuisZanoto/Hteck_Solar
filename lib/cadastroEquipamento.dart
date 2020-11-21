import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'model/equipamento.dart';


class CadastroEquipa extends StatefulWidget {
  @override
  _CadastroEquipaState createState() => _CadastroEquipaState();
}

class _CadastroEquipaState extends State<CadastroEquipa>  {

 var txtNome = TextEditingController();
  var txtSerial = TextEditingController();

  var db = FirebaseFirestore.instance;

  //Recuperar um DOCUMENTO  a partir do ID
  void getDocumentById(String id) async{

    await db.collection("equipamentos").doc(id).get()
      .then((doc){

        txtNome.text = doc.data()['nome'];
        txtSerial.text = doc.data()['serial'];

    });

  }
 


  @override
  Widget build(BuildContext context) {

    final String id = ModalRoute.of(context).settings.arguments;

    if ( id != null ){
      if (txtNome.text == '' && txtSerial.text == ''){
        getDocumentById(id);
      }
    }

    return Scaffold(
      
      appBar: AppBar(
        title: Text("Cadastrar Equipamentos"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            
            //CAMPO NOME
            TextField(
              controller: txtNome,
              style:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Nome",
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //CAMPO PREÇO
            TextField(
              controller: txtSerial,
              style:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Serial",
              ),
            ),
            SizedBox(
              height: 30,
            ),

          //BOTÕES
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: RaisedButton(
                    color: Colors.blue[500],
                    child: Text("salvar",style: TextStyle(color: Colors.white, fontSize: 20)),
                    
                    onPressed: () async{

                      if (id == null){  
                        //ADICIONAR um novo DOCUMENTO a COLEÇÃO
                        await db.collection("equipamentos").add(
                          {
                            "nome" : txtNome.text,
                            "serial" : txtSerial.text
                          }
                        );
                      }else{
                        //ATUALIZAR dados do DOCUMENTO
                        await db.collection("equipamentos").doc(id).update(
                          {
                            "nome" : txtNome.text,
                            "serial" : txtSerial.text
                          }
                        );
                      }
                      Navigator.pop(context);

                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 150,
                  child: RaisedButton(
                    color: Colors.blue[500],
                    child: Text("cancelar",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ])),
      backgroundColor: Colors.blue[50],
    );
  }



}

