import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../models/ordem.dart';

class OrdensListPage extends StatefulWidget {
  const OrdensListPage({super.key});

  @override
  State<OrdensListPage> createState() => _OrdensListPageState();
}

class _OrdensListPageState extends State<OrdensListPage> {
  List<Ordem> _ordens = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    setState(() => _loading = true);
  final api = Provider.of<AuthProvider>(context, listen: false).api;
  final resp = await api.get('/ordens/');
    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body) as List;
      setState(() => _ordens = data.map((e) => Ordem.fromJson(e)).toList());
    } else {
      // ignore for now
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ordens')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _fetch,
              child: ListView.builder(
                itemCount: _ordens.length,
                itemBuilder: (context, idx) {
                  final o = _ordens[idx];
                  return ListTile(
                    title: Text('#${o.numero} - ${o.clienteNome}'),
                    subtitle: Text(o.status),
                    trailing: o.tecnicoNome != null ? Text(o.tecnicoNome!) : null,
                    onTap: () {
                      Navigator.of(context).pushNamed('/ordens/${o.id}');
                    },
                  );
                },
              ),
            ),
    );
  }
}
