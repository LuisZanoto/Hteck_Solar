import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hteck_solar/configuracao.dart';
import 'package:hteck_solar/home.dart';
//import 'package:flutter_blue/flutter_blue.dart';
import 'sobre.dart';
import 'login.dart';
import 'menu.dart';
import 'grafico.dart';
import 'cadastro.dart';




void main(){

  

  runApp(MaterialApp(    
    debugShowCheckedModeBanner: false,
    title: "HTECK SOLAR",
    //Navegação
    initialRoute: '/tela_login',
    routes:{
      
      '/tela_login' :(context)=> TelaLogin(),
      '/tela_menu' :(context)=> TelaMenu(),
      '/tela_config' :(context)=> TelaConfiguracao(),
      '/tela_home':(context)=> TelaHome(),
      '/tela_grafico' :(context)=> TelaGrafico(),
      '/tela_sobre' :(context)=> TelaSobre(),
      '/tela_cadastro' :(context)=> CadastroUsuarios(),
                


    }
   
  ));

}

