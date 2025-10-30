import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/token_storage.dart';

class OrdersListScreen extends StatefulWidget {
  const OrdersListScreen({Key? key}) : super(key: key);

  @override
  State<OrdersListScreen> createState() => _OrdersListScreenState();
}

class _OrdersListScreenState extends State<OrdersListScreen> {
  final List<Map<String, dynamic>> _orders = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    final token = await TokenStorage.getAccessToken();
    if (token == null) {
      setState(() {
        _loading = false;
      });
      return;
    }

    try {
      final api = ApiService(baseUrl: 'http://localhost:8000');
      List<Map<String, dynamic>> list = [];
      try {
        list = await api.listOrders(token);
      } catch (e) {
        // If unauthorized, try refresh
        if (e.toString().contains('401')) {
          final refresh = await TokenStorage.getRefreshToken();
          if (refresh != null) {
            try {
              final res = await api.refreshToken(refresh);
              final newAccess = res['access'] as String?;
              final newRefresh = res['refresh'] as String?;
              if (newAccess != null && newRefresh != null) {
                await TokenStorage.saveTokens(newAccess, newRefresh);
                list = await api.listOrders(newAccess);
              }
            } catch (_) {
              // fallthrough
            }
          }
        }
      }
      setState(() {
        _orders.clear();
        _orders.addAll(list.map((e) => {
              'id': e['id'],
              'numero': e['numero'] ?? e['slug'] ?? 'OS',
              'cliente': (e['cliente'] is Map) ? (e['cliente']['nome'] ?? '') : (e['cliente'] ?? ''),
              'status': e['status'] ?? ''
            }));
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ordens de Serviço')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _orders.isEmpty
              ? const Center(child: Text('Nenhuma ordem encontrada'))
              : ListView.builder(
                  itemCount: _orders.length,
                  itemBuilder: (context, index) {
                    final o = _orders[index];
                    return ListTile(
                      title: Text(o['numero']),
                      subtitle: Text('${o['cliente']} • ${o['status']}'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
