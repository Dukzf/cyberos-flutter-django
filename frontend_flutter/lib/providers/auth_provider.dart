import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../api/api_client.dart';

class AuthProvider extends ChangeNotifier {
  final ApiClient api;
  final _storage = const FlutterSecureStorage();

  bool _loading = true;
  bool get loading => _loading;

  bool get loggedIn => api.accessToken != null;

  AuthProvider({required this.api}) {
    _init();
  }

  Future<void> _init() async {
    final access = await _storage.read(key: 'access_token');
    if (access != null) api.accessToken = access;
    _loading = false;
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    final resp = await api.post('/token/', {'username': username, 'password': password});
    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      final access = data['access'] as String?;
      final refresh = data['refresh'] as String?;
      if (access != null) {
        api.accessToken = access;
        await _storage.write(key: 'access_token', value: access);
        if (refresh != null) await _storage.write(key: 'refresh_token', value: refresh);
        notifyListeners();
        return true;
      }
    }
    return false;
  }

  Future<void> logout() async {
    api.accessToken = null;
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
    notifyListeners();
  }
}
