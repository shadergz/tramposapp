import 'package:flutter/material.dart';

import 'tela_pesquisa.dart' as pesquisar;

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  void showOptionsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
    );
  }

// Colore o campo do valor, caso ele respeite as regras abaixo
Color pegarCorValor(int price) {
  if (price < 100) {
    return Colors.green;
  } else if (price < 150) {
    return Colors.yellow;
  } else {
    return Colors.red;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TramposOn'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showOptionsMenu(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Pesquisar',
              border: OutlineInputBorder(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const pesquisar.TelaPesquisa(),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text('Trabalhador ${index + 1}'),
                    subtitle: Text('Ocupação ${index + 1}'),
                    trailing: Text(
                      'R\$ ${(index + 1) * 10}',
                      style: TextStyle(
                        color: pegarCorValor((index + 1) * 10),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
