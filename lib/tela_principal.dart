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
              title: const Text('Exit'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
    );
  }

Color getPriceColor(int price) {
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
        title: const Text('Main Screen'),
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
              hintText: 'Search',
              border: OutlineInputBorder(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const pesquisar.SearchScreen(),
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
                    title: Text('User ${index + 1}'),
                    subtitle: Text('Occupation ${index + 1}'),
                    trailing: Text(
                      '\$${(index + 1) * 10}',
                      style: TextStyle(
                        color: getPriceColor((index + 1) * 10),
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
