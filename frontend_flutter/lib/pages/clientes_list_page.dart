import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class ClientesListPage extends StatefulWidget {
  const ClientesListPage({super.key});

  @override
  State<ClientesListPage> createState() => _ClientesListPageState();
}

class _ClientesListPageState extends State<ClientesListPage> {
  List _clientes = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    setState(() => _loading = true);
    final api = Provider.of<AuthProvider>(context, listen: false).api;
    final resp = await api.get('/clientes/');
    if (resp.statusCode == 200) {
      setState(() => _clientes = jsonDecode(resp.body) as List);
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clientes')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _clientes.length,
              itemBuilder: (context, idx) {
                final c = _clientes[idx] as Map<String, dynamic>;
                return ListTile(
                  title: Text(c['nome'] ?? c['razao_social'] ?? 'Cliente'),
                  subtitle: Text(c['telefone'] ?? ''),
                );
              },
            ),
    );
  }
}
