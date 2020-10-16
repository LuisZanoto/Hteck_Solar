import "package:flutter/material.dart";

class SobreWidget extends StatelessWidget {
  // atributos
final String tema;
final String objetivo;
final String foto;

//construtor
SobreWidget(this.tema, this.objetivo, this.foto): super();

  @override
  Widget build(BuildContext context) {
    return Container(
      // Recursos
      padding: EdgeInsets.all(20),      
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width:4),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
          
          ),

        gradient: LinearGradient(
          
          colors:[Colors.blueAccent, Colors.greenAccent ,Colors.amberAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,


      ),
      ),

      child: Center(
        child: Column(
          children: [
          Text(tema, style: TextStyle(fontSize: 14),),
          Text(objetivo, style: TextStyle(fontSize: 12),),          
          Image.asset(foto, scale: 3.8,),

        ],),
      )
      
    );
  }
}

class TelaSobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sobre : Hteck Solar V1.02"),),
      body: SingleChildScrollView(
        
          child: Column(children: [
                  SobreWidget("Desenvolvedor: Luis Zanoto", "Curso : ADS Noturno", "imagens/foto_luis.jpg"),
                  SobreWidget("Hteck Solar", "Versão Beta 1.02", "imagens/casa1.jpeg"),
                  SizedBox(height: 10,), 
                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.deepPurpleAccent,
                    child: Text("Menu"),
                    onPressed: (){
                     Navigator.pop(context);
                     },          
          
          ), 
          ],),        

      ),

    );
  }
}