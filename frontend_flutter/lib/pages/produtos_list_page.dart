import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class ProdutosListPage extends StatefulWidget {
  const ProdutosListPage({super.key});

  @override
  State<ProdutosListPage> createState() => _ProdutosListPageState();
}

class _ProdutosListPageState extends State<ProdutosListPage> {
  List _items = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    setState(() => _loading = true);
    final api = Provider.of<AuthProvider>(context, listen: false).api;
    final resp = await api.get('/produtos/');
    if (resp.statusCode == 200) _items = jsonDecode(resp.body) as List;
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produtos')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, idx) {
                final p = _items[idx] as Map<String, dynamic>;
                return ListTile(
                  title: Text(p['nome'] ?? 'Produto'),
                  subtitle: Text('Estoque: ${p['estoque'] ?? 0}'),
                );
              },
            ),
    );
  }
}
