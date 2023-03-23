import 'package:flutter/material.dart';
import 'usuarios_db.dart' as banco_dados;
import 'tela_criarperfil.dart' as criar;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _username = '', _firstName = '', _lastName = '', _occupation = '', _email = '', _password = '';
  int _age = 0;

  // Criando uma nova referência ao nosso banco de dados
  final usuarios = banco_dados.DatabaseHelper.instance;

  Widget _buildUsername() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Username'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Username is required';
        }
        return null;
      },
      onSaved: (String? value) {
        _username = value!;
      },
    );
  }

  Widget _buildFirstName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'First Name'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'First Name is required';
        }
        return null;
      },
      onSaved: (String? value) {
        _firstName = value!;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Last Name'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Last Name is required';
        }
        return null;
      },
      onSaved: (String? value) {
        _lastName = value!;
      },
    );
  }

  Widget _buildAge() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Age'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Age is required';
        }
        if (int.tryParse(value) == null) {
          return 'Please enter a valid age';
        }
        return null;
      },
      onSaved: (String? value) {
        _age = int.parse(value!);
      },
    );
  }

  Widget _buildOccupation() {
    return DropdownButtonFormField<String>(
      value: _occupation,
      decoration: const InputDecoration(labelText: 'Occupation'),
      items: <String>['IT', 'Professor', 'Doctor', 'Other']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          _occupation = value!;
        });
      },
      onSaved: (String? value) {
        _occupation = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Email is required';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
      onSaved: (String? value) {
        _email = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(labelText: 'Password'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Password is required';
        }
        if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }
        // Deve ser nulo pois as regras da senha estão corretas
        return null;
      },
      onSaved: (String? value) {
        _password = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
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
                _buildUsername(),
                _buildFirstName(),
                _buildLastName(),
                _buildAge(),
                _buildOccupation(),
                _buildEmail(),
                _buildPassword(),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Register'),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    _formKey.currentState!.save();
                    
                    // Salva as informações fornecidas pelo o usuário e as gravam dentro do nosso banco de dados
                    Map<String, dynamic> dadosCadastrais = {
                      banco_dados.DatabaseHelper.columnUsername: _username,
                      banco_dados.DatabaseHelper.columnFirstName: _firstName,
                      banco_dados.DatabaseHelper.columnLastName: _lastName,
                      banco_dados.DatabaseHelper.columnAge: _age,
                      banco_dados.DatabaseHelper.columnOccupation: _occupation,
                      banco_dados.DatabaseHelper.columnEmail: _email,
                      banco_dados.DatabaseHelper.columnPassword: _password
                    };
                    // Inserindo as informações do usuário dentro do banco de dados
                    usuarios.insert(dadosCadastrais);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const criar.ProfileEditingScreen()),
                    );   

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
