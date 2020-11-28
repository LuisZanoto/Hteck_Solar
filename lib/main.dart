import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hteck_solar/configuracao.dart';
import 'package:hteck_solar/statusAtual.dart';
import 'package:firebase_core/firebase_core.dart';
import 'sobre.dart';
import 'login.dart';
import 'menu.dart';
import 'grafico.dart';
import 'cadastro.dart';
import 'cadastroEquipamento.dart';
import 'listaEquip.dart';




void main() async {

  //Registrar o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(    
    debugShowCheckedModeBanner: false,
    title: "HTECK SOLAR",
    //Navegação
    initialRoute: '/tela_login',
    routes:{
      
      '/tela_login' :(context)=> TelaLogin(),
      '/tela_menu' :(context)=> TelaMenu(),
      '/tela_config' :(context)=> TelaConfiguracao(),
      '/tela_stat':(context)=> TelaHome(),
      '/tela_grafico' :(context)=> TelaGrafico(),
      '/tela_sobre' :(context)=> TelaSobre(),
      '/tela_cadastro' :(context)=> CadastroUsuarios(),
      '/tela_cad_equip' :(context)=> CadastroEquipa(),
      '/tela_Lista_equip' :(context)=> ListaEquipa(),
      
                


    }
   
  ));

}

