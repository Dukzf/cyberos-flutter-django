import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class EquipamentosListPage extends StatefulWidget {
  const EquipamentosListPage({super.key});

  @override
  State<EquipamentosListPage> createState() => _EquipamentosListPageState();
}

class _EquipamentosListPageState extends State<EquipamentosListPage> {
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
    final resp = await api.get('/equipamentos/');
    if (resp.statusCode == 200) {
      setState(() => _items = jsonDecode(resp.body) as List);
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Equipamentos')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, idx) {
                final e = _items[idx] as Map<String, dynamic>;
                return ListTile(
                  title: Text(e['nome'] ?? 'Equipamento'),
                  subtitle: Text(e['modelo'] ?? ''),
                );
              },
            ),
    );
  }
}
