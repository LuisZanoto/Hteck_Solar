
//import 'dart:html';

import 'package:flutter/material.dart';
import 'bancoDados.dart';



class CadastroUsuarios extends StatelessWidget {
  // referencia nossa classe single para gerenciar o banco de dados
  final dbHelper = DatabaseHelper.instance;
  // pra instanciar o snackbar
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

// ignore: non_constant_identifier_names
var txt_Email;
// ignore: non_constant_identifier_names
var txt_Senha;

 void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  // layout da homepage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Cadastrar Usuários :'),        
      ),
      body: Container(        
        child: Column(          
          mainAxisAlignment: MainAxisAlignment.center,          
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email:'
              ),
              onChanged: (value){
                txt_Email = value.toString();
              },
            ),
             SizedBox(height: 20,),

            TextField(
              obscureText: true,
              decoration: InputDecoration(
                
                border: OutlineInputBorder(),
                labelText: 'Senha:'
              ),
              onChanged: (value){
                txt_Senha = value.toString();
              },
            ),

            SizedBox(height: 20,), 
                        RaisedButton(
            textColor: Colors.white,
            color: Colors.deepPurpleAccent,
            child: Text('Inserir Dados'),
            onPressed: () {
              _inserir(txt_Email, txt_Senha);
              _showScaffold("Dados Inseridos !");
            },
          ),

 
            RaisedButton(
            textColor: Colors.white,
            color: Colors.deepPurpleAccent,
            child: Text('Consultar dados (debug)'),
            onPressed: () {
              _consultar();
              _showScaffold("Dados consultados");
            },
          ),

            RaisedButton(
            textColor: Colors.white,
            color: Colors.deepPurpleAccent,
            child: Text('Deletar último Usuário'),
            onPressed: () {
              _deletar();
              _showScaffold("Dados deletados");
            },
          ),



                  SizedBox(height: 20,), 
                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.deepPurpleAccent,
                    child: Text("Menu", style: TextStyle(fontSize: 15),),
                    onPressed: (){Navigator.pop(context);}, 
                  ),
          ],
        ),
      ),
    );
  }
   // métodos dos Buttons 
  void _inserir(var email, var senha) async {
    // linha para incluir
    Map<String, dynamic> row = {
      DatabaseHelper.columnEmail : email,
      DatabaseHelper.columnSenha  : senha
    };
    final id = await dbHelper.insert(row);
    print('linha inserida id: $id');
  }
  void _consultar() async {
    final todasLinhas = await dbHelper.queryAllRows();  
    

    print('Consulta todas as linhas:');
    todasLinhas.forEach((row) => print(row));  

    // Teste de senha
    //var vari = todasLinhas.firstWhere((row) => row['email']=='Luis')  ;
    //print (vari['senha']);

  }
  void _atualizar() async {
    // linha para atualizar
    Map<String, dynamic> row = {
      DatabaseHelper.columnId   : 1,
      DatabaseHelper.columnEmail : 'Luis',
      DatabaseHelper.columnSenha  : '123'
    };
    final linhasAfetadas = await dbHelper.update(row);
    print('atualizadas $linhasAfetadas linha(s)');
  }
  void _deletar() async {
    // Assumindo que o numero de linhas é o id para a última linha
    final id = await dbHelper.queryRowCount();
    final linhaDeletada = await dbHelper.delete(id);
    print('Deletada(s) $linhaDeletada linha(s): linha $id');
  }
    void _deletar_tudo() async {
    // Assumindo que o numero de linhas é o id para a última linha
    int id = await dbHelper.queryRowCount();
    
    for (id ; id> 0 ; id--){
      final linhaDeletada = await dbHelper.delete(id);
      print('Deletada(s) $linhaDeletada linha(s): linha $id');
    }
  }

showAlertDialog1(BuildContext context) {

 SnackBar(
  content: Text('Yay! A SnackBar!'),
  action: SnackBarAction(
    label: 'Undo',
    onPressed: () {
      // Some code to undo the change.
    },
  ),
);

}

}

