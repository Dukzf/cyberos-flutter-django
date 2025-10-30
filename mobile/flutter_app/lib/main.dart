import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/orders_list_screen.dart';

void main() {
  runApp(const CyberosApp());
}

class CyberosApp extends StatelessWidget {
  const CyberosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CyberOS Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (c) => const LoginScreen(),
        '/home': (c) => const HomeScreen(),
        '/orders': (c) => const OrdersListScreen(),
        '/map': (c) => const TechniciansMapScreen(),
        '/orders/create': (c) => const CreateOrderScreen(),
      },
    );
  }
}
