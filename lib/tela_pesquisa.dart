import 'package:flutter/material.dart';

class TelaPesquisa extends StatelessWidget {
  const TelaPesquisa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados da Busca'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Encontrado: ${index + 1}'),
            subtitle: Text('Ocupação: ${index + 1}'),
          );
        },
      ),
    );
  }
}
