import 'package:flutter/material.dart';
import 'tela_registrar.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TelaEstadoLogin createState() => _TelaEstadoLogin();
}

class _TelaEstadoLogin extends State<TelaLogin> {
  final GlobalKey<FormState> _chaveFormal = GlobalKey<FormState>();
  
  // ignore: unused_field
  String _dadoUsername = '', _dadoSenha = '';

  Widget _campoUsername() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Username'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'O campo Username é necessário';
        }
        return null;
      },
      onSaved: (String? value) {
        _dadoUsername = value!;
      },
    );
  }

  Widget _campoSenha() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Senha'),
      obscureText: true,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'O campo Senha é necessário';
        }
        return null;
      },
      onSaved: (String? value) {
        _dadoSenha = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
          child: Form(
            key: _chaveFormal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Logar',
                  style: TextStyle(fontSize: 30.0),
                ),
                const SizedBox(height: 30.0),
                _campoUsername(),
                const SizedBox(height: 20.0),
                _campoSenha(),
                const SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        if (!_chaveFormal.currentState!.validate()) {
                          return;
                        }
                        _chaveFormal.currentState!.save();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Logar',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
          
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        if (!_chaveFormal.currentState!.validate()) {
                          return;
                        }
                        _chaveFormal.currentState?.save();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaRegistrar()),
                        );
                      },
                      child: const Text(
                        'Registrar-se',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Ou faça o cadastro com:',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                      },
                      child: const Text(
                        'Google',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                      },
                      child: const Text(
                        'Facebook',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}