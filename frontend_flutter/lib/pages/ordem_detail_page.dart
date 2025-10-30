import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class OrdemDetailPage extends StatefulWidget {
  final int id;
  const OrdemDetailPage({super.key, required this.id});

  @override
  State<OrdemDetailPage> createState() => _OrdemDetailPageState();
}

class _OrdemDetailPageState extends State<OrdemDetailPage> {
  Map<String, dynamic>? _ordem;
  bool _loading = true;
  final _commentCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    setState(() => _loading = true);
    final api = Provider.of<AuthProvider>(context, listen: false).api;
    final resp = await api.get('/ordens/${widget.id}/');
    if (resp.statusCode == 200) {
      setState(() => _ordem = jsonDecode(resp.body) as Map<String, dynamic>?);
    }
    setState(() => _loading = false);
  }

  Future<void> _iniciar() async {
    final api = Provider.of<AuthProvider>(context, listen: false).api;
    final resp = await api.patch('/ordens/${widget.id}/iniciar_atendimento/', {});
    if (resp.statusCode == 200 || resp.statusCode == 204) await _fetch();
  }

  Future<void> _finalizar() async {
    final api = Provider.of<AuthProvider>(context, listen: false).api;
    final resp = await api.patch('/ordens/${widget.id}/finalizar_atendimento/', {});
    if (resp.statusCode == 200 || resp.statusCode == 204) await _fetch();
  }

  Future<void> _sendComment() async {
    final text = _commentCtrl.text.trim();
    if (text.isEmpty) return;
    final api = Provider.of<AuthProvider>(context, listen: false).api;
    final resp = await api.post('/comentarios/', {'ordem': widget.id, 'texto': text});
    if (resp.statusCode == 201 || resp.statusCode == 200) {
      _commentCtrl.clear();
      await _fetch();
    }
  }

  Future<void> _uploadAttachment() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    final file = File(result.files.single.path!);
    final api = Provider.of<AuthProvider>(context, listen: false).api;
    final mfile = await http.MultipartFile.fromPath('arquivo', file.path);
    final resp = await api.postMultipart('/anexos/', {'ordem': widget.id.toString()}, [mfile]);
    if (resp.statusCode == 201 || resp.statusCode == 200) await _fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ordem #${widget.id}')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _ordem == null
              ? const Center(child: Text('Ordem não encontrada'))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cliente: ${_ordem!['cliente'] ?? '—'}', style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 8),
                      Text('Status: ${_ordem!['status'] ?? '—'}'),
                      const SizedBox(height: 12),
                      Row(children: [
                        ElevatedButton(onPressed: _iniciar, child: const Text('Iniciar atendimento')),
                        const SizedBox(width: 8),
                        ElevatedButton(onPressed: _finalizar, child: const Text('Finalizar atendimento')),
                        const SizedBox(width: 8),
                        ElevatedButton(onPressed: _uploadAttachment, child: const Text('Enviar anexo')),
                      ]),
                      const SizedBox(height: 16),
                      const Text('Comentários', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      ...((_ordem!['comentarios'] as List?) ?? []).map((c) => ListTile(
                            title: Text(c['texto'] ?? ''),
                            subtitle: Text(c['autor'] ?? ''),
                          )),
                      const SizedBox(height: 8),
                      TextField(controller: _commentCtrl, decoration: const InputDecoration(labelText: 'Novo comentário')),
                      const SizedBox(height: 8),
                      SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _sendComment, child: const Text('Enviar')))
                    ],
                  ),
                ),
    );
  }
}
