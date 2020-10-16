import 'package:flutter/material.dart';


class TelaMenu extends StatefulWidget {
  @override
  _TelaMenuState createState() => _TelaMenuState();
}

class _TelaMenuState extends State<TelaMenu> {
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
                Navigator.pushNamed(context, '/tela_grafico');
              },
            ),

             ListTile(
              hoverColor: Colors.blue[400],
              leading: Icon(Icons.double_arrow),    
              title: Text('Status Atual', style: TextStyle(fontSize: 20)),
              trailing: Icon(Icons.quickreply),
              onTap: (){
                Navigator.pushNamed(context, '/tela_home');
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