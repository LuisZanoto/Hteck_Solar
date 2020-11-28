import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/dadosPot.dart';


class TelaMenu extends StatefulWidget {
  @override
  _TelaMenuState createState() => _TelaMenuState();
}

class _TelaMenuState extends State<TelaMenu> {
  var data = List<Dados>();

  Future<List> getDados() async {
    try {
      final resposta =
          await http.get("https://hteck-solar-luis.firebaseio.com/dados.json");
      //print(resposta.body);
      List<dynamic> lista = json.decode(resposta.body);
      lista.forEach((e) {
        data.add(Dados.fromJson(e));
        print(e);
      });
      return data;
    } catch (erro) {
      print(erro.toString());
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    getDados();
  }



  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text('Menu Principal:')),
      
      body: Container( 
        padding: EdgeInsets.all(20), // espaçamento geral
        //color: Colors.green[100],
        child: ListView( 
          children:[ 

            //Text("Menu", style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            ListTile(
              
              
              leading: Icon(Icons.double_arrow),    
              title: Text('Configurações', style: TextStyle(fontSize: 20)),
              trailing: Icon(Icons.app_settings_alt),
              hoverColor: Colors.blue[400],
              onTap: (){
                Navigator.pushNamed(context, '/tela_config');
              },
            ),     
               
            ListTile(
              
              leading: Icon(Icons.double_arrow),    
              title: Text('Grafico', style: TextStyle(fontSize: 20)),
              trailing: Icon(Icons.addchart),
              hoverColor: Colors.blue[400],
              onTap: (){
                //************************************  Cria grafico com os dados passados em argument
                Navigator.pushNamed(context, '/tela_grafico', arguments: data);
              },
            ),

             ListTile(
              hoverColor: Colors.blue[400],
              leading: Icon(Icons.double_arrow),    
              title: Text('Status Atual', style: TextStyle(fontSize: 20)),
              trailing: Icon(Icons.quickreply),
              onTap: (){
                Navigator.pushNamed(context, '/tela_stat');
              },
            ), 

             ListTile(
              hoverColor: Colors.blue[400],
              leading: Icon(Icons.double_arrow),    
              title: Text('Sobre Desenvolvedor', style: TextStyle(fontSize: 20)),
              trailing: Icon(Icons.account_box_rounded),
              onTap: (){
                Navigator.pushNamed(context, '/tela_sobre');
              },
            ), 

              ListTile(
              hoverColor: Colors.blue[400],
              leading: Icon(Icons.double_arrow),    
              title: Text('Cadastro de Usuarios', style: TextStyle(fontSize: 20)),
              trailing: Icon(Icons.person_search),
              onTap: (){
                Navigator.pushNamed(context, '/tela_cadastro');
              },
            ), 

            ListTile(
              hoverColor: Colors.blue[400],
              leading: Icon(Icons.double_arrow),    
              title: Text('Logout', style: TextStyle(fontSize: 20)),
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