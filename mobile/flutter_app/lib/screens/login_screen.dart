import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/token_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _loading = false;

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    // Integrar com a API JWT
    try {
      final api = ApiService(baseUrl: 'http://localhost:8000'); // atualize se necessario
      final result = await api.login(_usernameController.text.trim(), _passwordController.text);
      final access = result['access'] as String?;
      final refresh = result['refresh'] as String?;

      if (access != null && refresh != null) {
        await TokenStorage.saveTokens(access, refresh);
        setState(() => _loading = false);
        Navigator.pushReplacementNamed(context, '/home');
        return;
      }

      throw Exception('Resposta inesperada do servidor');
    } catch (e) {
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro no login: ${e.toString()}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CyberOS - Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 92),
            const SizedBox(height: 24),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Usuário'),
                    validator: (v) => (v == null || v.isEmpty) ? 'Informe o usuário' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Senha'),
                    obscureText: true,
                    validator: (v) => (v == null || v.isEmpty) ? 'Informe a senha' : null,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _loading ? null : _submit,
                      child: _loading ? const CircularProgressIndicator() : const Text('Entrar'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
