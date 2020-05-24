import 'package:coopapp/screens/loading_screen.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LoadingScreen()
    );
  }
}

//TODO: fazer a parte de configurações do aplicativo
//TODO: fazer o sistema de pedidos funcional
//TODO: fazer o sistema de busca funcional
//TODO: por marker na localização
//TODO: menu de gerencia(lista de pedidos e seus respectivos codigos)
