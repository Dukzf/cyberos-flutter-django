import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// HomePage: lista itens e permite adicionar novos.
/// NOTE: Em emuladores Android use 10.0.2.2 para alcançar o host local.
const String apiBase = 'http://10.0.2.2:8000/api'; // mudar para 127.0.0.1 em ambientes que suportem

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List items = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    setState(() => loading = true);
    try {
      final res = await http.get(Uri.parse('\$apiBase/items/'));
      if (res.statusCode == 200) {
        setState(() {
          items = jsonDecode(res.body) as List;
        });
      } else {
        debugPrint('Erro ao buscar items: \\$res');
      }
    } catch (e) {
      debugPrint('Exception fetchItems: \\$e');
    } finally {
      setState(() => loading = false);
    }
  }

  Future<void> addItem(String nome, String descricao) async {
    try {
      final res = await http.post(
        Uri.parse('\$apiBase/items/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'nome': nome, 'descricao': descricao}),
      );
      if (res.statusCode == 201) {
        fetchItems();
      } else {
        debugPrint('Erro ao criar item: \\$res');
      }
    } catch (e) {
      debugPrint('Exception addItem: \\$e');
    }
  }

  void showAddDialog() {
    final nomeCtrl = TextEditingController();
    final descCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Adicionar item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomeCtrl,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: descCtrl,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              final nome = nomeCtrl.text.trim();
              final desc = descCtrl.text.trim();
              if (nome.isNotEmpty) {
                addItem(nome, desc);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Itens'),
      ),
      body: RefreshIndicator(
        onRefresh: fetchItems,
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    title: Text(item['nome'] ?? ''),
                    subtitle: Text(item['descricao'] ?? ''),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
