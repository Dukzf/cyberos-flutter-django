import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api/api_client.dart';
import 'pages/login_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/ordens_list_page.dart';
import 'pages/ordem_detail_page.dart';
import 'pages/clientes_list_page.dart';
import 'pages/equipamentos_list_page.dart';
import 'pages/produtos_list_page.dart';
import 'pages/relatorios_page.dart';
import 'pages/mapa_tecnicos_page.dart';
import 'providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final api = ApiClient(baseUrl: 'http://10.0.2.2:8000/api');
  runApp(ChangeNotifierProvider(
    create: (_) => AuthProvider(api: api),
    child: CyberOSApp(api: api),
  ));
}

class CyberOSApp extends StatelessWidget {
  final ApiClient api;
  const CyberOSApp({super.key, required this.api});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CyberOS Mobile',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: false,
      ),
      home: Consumer<AuthProvider>(builder: (context, auth, _) {
        if (auth.loading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
        return auth.loggedIn ? const DashboardPage() : const LoginPage();
      }),
      routes: {
        '/': (ctx) => const DashboardPage(),
  '/login': (ctx) => const LoginPage(),
  '/ordens': (ctx) => const OrdensListPage(),
  '/clientes': (ctx) => const ClientesListPage(),
  '/equipamentos': (ctx) => const EquipamentosListPage(),
  '/produtos': (ctx) => const ProdutosListPage(),
  '/relatorios': (ctx) => const RelatoriosPage(),
  '/mapa-tecnicos': (ctx) => const MapaTecnicosPage(),
      },
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name ?? '');
        if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'ordens') {
          final id = int.tryParse(uri.pathSegments[1]);
          if (id != null) return MaterialPageRoute(builder: (_) => OrdemDetailPage(id: id));
        }
        return null;
      },
    );
  }
}
