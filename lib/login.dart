import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'bancoDados.dart';


class  TelaLogin extends StatelessWidget { 

var txtEmail;
var txtSenha;  
String email_def= "admin";
String txt_def = "123"; 

final dbHelper = DatabaseHelper.instance;
int loginOk = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hteck Solar V1.02"),),
      //appBar: AppBar(title: Text(txtValor3.toString()),),
      body: Container(
          padding: EdgeInsets.only(
            top: 20,
            left:40,
            right:40,
          ),        
        color: Colors.blue[100],
        child: ListView(
          children: <Widget>[
            SizedBox(
              width:128,
              height:128,              
              child: Image.asset("imagens/casa1.jpeg", scale: 5.4,),
            ),
            SizedBox(height: 20,),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail:",
                labelStyle: TextStyle(
                  color:Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  )
              ),
              style: TextStyle(fontSize:20),
                onChanged: (value){
                txtEmail = value.toString();
              },
              ), 
            SizedBox(height: 20,),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha:",
                labelStyle: TextStyle(
                  color:Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  )
              ),
              style: TextStyle(fontSize:20),
              onChanged: (value){
                txtSenha = value.toString();
                consulta(txtEmail, txtSenha);
              },
              ),

              SizedBox(height: 10,),

              Container(
                height: 30,
                alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width:2),
                          borderRadius: BorderRadius.all(
                          Radius.circular(3),          
                          ),
                          gradient: LinearGradient(          
                          colors:[Colors.transparent, Colors.greenAccent ,Colors.yellow],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          ),
                    ),
                child:FlatButton(
                child: Text(
                  "Recuperar Senha",                  
                ),
                onPressed:(){ },
                ),
                ), 
                 SizedBox(height: 10,), 
                Container(                
                padding: EdgeInsets.all(10), // EdgeInsets.symetric(horizontal:100) ou
                  // vertical ou EdgeInsets.fromLTRB ( left, top, right, button)
                margin: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width:4),
                    borderRadius: BorderRadius.all(
                    Radius.circular(10),          
                    ),
                    gradient: LinearGradient(          
                    colors:[Colors.blueAccent, Colors.greenAccent ,Colors.black87],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    ),
                ), 
                child: FlatButton(
                child: Text("login"),
                onPressed: (){                           
                   
                  // se OK
                  if(loginOk==1){
                  Navigator.pushNamed(context, '/tela_menu'); 
                  }

                },          
          
          ),                  
                  
                ),

          ],
         
        ),
        ),
        
    );
  }



consulta ( var email, var senha) async{
    

   if(senha == "123" && email == "admin"){
    loginOk = 1; 
    print('true : admin');   
   } 
   else{
     loginOk = 0;
    final linhasBanco = await dbHelper.queryAllRows();

    print('Imprime Banco de Dados atual:');
    linhasBanco.forEach((row) => print(row));  
    var vari = linhasBanco.firstWhere((row) => row['email']== email)  ; // vari é uma linha que contém email igual
    //print (vari['senha']);

    if (senha == vari['senha']){ // se campo senha é igual, --> login = ok
      print(senha);
      loginOk = 1;
      
    }
    else {
      print('False');
      loginOk = 0;
      
    }

   }
    

}


}




