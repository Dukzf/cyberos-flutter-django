import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/token_storage.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({Key? key}) : super(key: key);

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _clienteController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  bool _loading = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    final token = await TokenStorage.getAccessToken();
    if (token == null) return;

    try {
      final api = ApiService(baseUrl: 'http://localhost:8000');
      await api.createOrder(token, {
        'cliente': _clienteController.text.trim(),
        'descricao': _descricaoController.text.trim(),
      });

      setState(() => _loading = false);
      Navigator.pop(context, true);
    } catch (e) {
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao criar ordem: ${e.toString()}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Ordem')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _clienteController,
                decoration: const InputDecoration(labelText: 'Cliente'),
                validator: (v) => v == null || v.isEmpty ? 'Informe o cliente' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                validator: (v) => v == null || v.isEmpty ? 'Informe a descrição' : null,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _loading ? null : _submit,
                  child: _loading ? const CircularProgressIndicator() : const Text('Criar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
