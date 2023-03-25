import 'package:flutter/material.dart';
import 'tela_login.dart' as login;
import 'tela_principal.dart' as principal;

import 'clientes.dart' as usu_trampos;


void main() {
  // Função main, tudo se inicia aqui!
  runApp(const TramposTelaRaiz());
}

// Este widget também é uma tela, porém o seu unico propósito é verificar
// se um usuário válido já está logado no sistema, caso não haja,
// ele deve empurrar a tela de login para o usuário!

class TramposTelaRaiz extends StatefulWidget {
  const TramposTelaRaiz({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _TrampoTelaVerificacao();
  }
}

class _TrampoTelaVerificacao extends State<TramposTelaRaiz> {
  late usu_trampos.Clientes clientesSistema;
  // Obtendo as preferências do aplicativo!
  bool usuarioLogado = false;

  _TrampoTelaVerificacao() {
    clientesSistema = usu_trampos.Clientes.instance;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TramposOn',
      // Seleciona se o usuário deva ir para a tela de login ou para a tela principal
      home: usuarioLogado ? const principal.MainScreen() : const login.TelaLogin(),
      theme: ThemeData(
      ),
    );
  }
}