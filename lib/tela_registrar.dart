import 'package:flutter/material.dart';
import 'clientes.dart' as clientes;
import 'usuario.dart' as usuario;

import 'tela_criarperfil.dart' as criar;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dadoUsername = '', _dadoPrimeiroNome = '', _dadoUltimoNome = '', _dadoOcupacao = '', _dadoEmail = '', _dadoSenha = '';
  int _dadoIdade = 0;

  // Criando uma nova referência ao nosso banco de clientes
  final clientesSistema = clientes.Clientes.instance;
  final List<String> ocupacoes = usuario.TrampoUsuario.ocupacoesProfissionais;

  // Os widgets abaixo criam todos os campos necessários na tela de Login
  Widget _addCampoUsername() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Username'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Campo Username é necessário';
        }
        return null;
      },
      onSaved: (String? value) {
        dadoUsername = value!;
      },
    );
  }

  Widget _addCampoPrimeiroNome() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Primeiro Nome'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Campo Primeiro Nome é necessário';
        }
        return null;
      },
      onSaved: (String? value) {
        _dadoPrimeiroNome = value!;
      },
    );
  }

  Widget _addCampoUltimoNome() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Último Nome'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Campo Último Nome é necessário';
        }
        return null;
      },
      onSaved: (String? value) {
        _dadoUltimoNome = value!;
      },
    );
  }

  Widget _addCampoIdade() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Idade'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Campo Idade é necessário';
        }
        if (int.tryParse(value) == null) {
          return 'Por favor digite uma idade válida';
        }
        return null;
      },
      onSaved: (String? value) {
        _dadoIdade = int.parse(value!);
      },
    );
  }

  Widget _addCampoOcupacao() {
    return DropdownButtonFormField<String>(
      value: _dadoOcupacao,
      decoration: const InputDecoration(labelText: 'Ocupação'),
      items: ocupacoes.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          _dadoOcupacao = value!;
        });
      },
      onSaved: (String? value) {
        _dadoOcupacao = value!;
      },
    );
  }

  Widget _addCampoEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Campo E-mail é necessário';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Por favor digite um e-mail válido';
        }
        return null;
      },
      onSaved: (String? value) {
        _dadoEmail = value!;
      },
    );
  }

  Widget _addCampoSenha() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(labelText: 'Senha'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Campo Senha é necessário';
        }
        if (value.length < 8) {
          return 'A senha deve possuir no mínimo 8 caracteres';
        }
        // Deve ser nulo pois as regras da senha estão corretas
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
      appBar: AppBar(
        title: const Text('Novo Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                // Adiciona todos os campos necessários na interface (Tela)
                _addCampoUsername(),
                _addCampoPrimeiroNome(),
                _addCampoUltimoNome(),
                _addCampoIdade(),
                _addCampoOcupacao(),
                _addCampoEmail(),
                _addCampoSenha(),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Registrar'),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    _formKey.currentState!.save();
                    // Salvando as informações fornecidas pelo novo usuário
                    // Inserindo as informações do usuário dentro do banco de usuarios

                    clientesSistema.cadastrarUsuario(
                        "$dadoUsername; "
                        "$_dadoPrimeiroNome; "
                        "$_dadoUltimoNome; "
                        "$_dadoOcupacao; "
                        "$_dadoEmail; "
                        "$_dadoSenha; "
                        "$_dadoIdade ");

                    // Levando o usuário à tela de edição do perfil!
                    // Está função descarta todas as outras interfaces (telas)
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const criar.ProfileEditingScreen()), );   
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
