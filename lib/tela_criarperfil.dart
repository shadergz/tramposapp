import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'tela_principal.dart';
import 'usuario.dart' as usuario;

class TelaEdicaoPerfil extends StatefulWidget {
  const TelaEdicaoPerfil({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TelaEstadoEdicaoPerfil createState() => _TelaEstadoEdicaoPerfil();
}

class _TelaEstadoEdicaoPerfil extends State<TelaEdicaoPerfil> {
  // ignore: unused_field
  File? _imagemSele;
  final picker = ImagePicker();

  Future pegarImagem() async {

  }

  // ignore: unused_field
  late String _dadoNome;
  // ignore: unused_field
  late String _dadoBio;
  // ignore: unused_field
  late DateTime _dadoInicio;
  // ignore: unused_field
  late DateTime _dadoFim;
  late double _valorDesejado;
  
  final Map<usuario.SoftSkills, String> usuarioHabi = usuario.TrampoUsuario.habilidades;
  // ignore: unused_field
  late final List<String> _habiSelecionadas = [];

  @override
  void initState() {
    super.initState();
    _imagemSele = null;
    _dadoNome = 'Gabriel Correia';
    _dadoBio = '';
    _dadoInicio = DateTime.now();
    _dadoFim = DateTime.now();
    _valorDesejado = 100;
  }

  Widget _addNovaTag(usuario.SoftSkills tag, int index) {
  return Draggable(
    data: index,
    feedback: Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Text(
        usuarioHabi[tag]!,
        style: const TextStyle(fontSize: 16.0),
      ),
    ),
    childWhenDragging: const SizedBox(),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Text(
        usuarioHabi[tag]!,
        style: const TextStyle(fontSize: 16.0),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edição de Perfil'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: pegarImagem,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/user.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Gabriel Correia',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const TextField(
                  maxLength: 180,
                  decoration: InputDecoration(
                    hintText: 'Escreva uma pequena biografia sobre você...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        'De',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: 50.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Text('7:00 AM'),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Até',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: 50.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Text('1:00 PM'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              const Text(
                'Habilidades Sociais',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        _addNovaTag(usuario.SoftSkills.comunicacao, 0),
                        _addNovaTag(usuario.SoftSkills.lidar, 1),
                        _addNovaTag(usuario.SoftSkills.trabalhoEquipe, 2),
                        _addNovaTag(usuario.SoftSkills.resolvedor, 3),
                        _addNovaTag(usuario.SoftSkills.gerente, 4),
                        _addNovaTag(usuario.SoftSkills.adaptabilidade, 5),
                        _addNovaTag(usuario.SoftSkills.criatividade, 6),
                        _addNovaTag(usuario.SoftSkills.resolConflitos, 7),
                        _addNovaTag(usuario.SoftSkills.habiOrganiza, 8),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Flexible(
                    child: DragTarget(
                      onAccept: (String data) {
                        setState(() {
                          _habiSelecionadas.add(data);
                        });
                      },
                      builder: (BuildContext context, List<String?> incoming, List<dynamic> rejected) {
                        return Container(
                          height: 200.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListView.builder(
                            itemCount: _habiSelecionadas.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(_habiSelecionadas[index]),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    setState(() {
                                      _habiSelecionadas.removeAt(index);
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Valor Desejado',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const SizedBox(width: 16.0),
                  const Text(
                    '50 R\$',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Slider(
                      value: _valorDesejado,
                      min: 50,
                      max: 200,
                      divisions: 30,
                      onChanged: (double value) {
                        setState(() {
                          _valorDesejado = value;
                        });
                      },
                    ),
                  ),
                  const Text(
                    '200 R\$',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 16.0),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Registrando as ultimas informações do usuário e pulando para a interface principal
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()),);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Text(
                  'Continuar',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}