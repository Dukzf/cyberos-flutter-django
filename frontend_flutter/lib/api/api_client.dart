import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  final String baseUrl;
  String? accessToken;

  final _storage = const FlutterSecureStorage();

  ApiClient({required this.baseUrl, this.accessToken});

  Map<String, String> defaultHeaders([bool jsonBody = true]) {
    final headers = <String, String>{};
    if (jsonBody) headers['Content-Type'] = 'application/json';
    if (accessToken != null) headers['Authorization'] = 'Bearer $accessToken';
    return headers;
  }
  Future<http.Response> get(String path) async {
    final uri = Uri.parse('$baseUrl$path');
    final resp = await http.get(uri, headers: defaultHeaders(false));
    if (resp.statusCode == 401) {
      final ok = await _tryRefresh();
      if (ok) return http.get(uri, headers: defaultHeaders(false));
    }
    return resp;
  }

  Future<http.Response> post(String path, Map body) async {
    final uri = Uri.parse('$baseUrl$path');
    final resp = await http.post(uri, headers: defaultHeaders(), body: jsonEncode(body));
    if (resp.statusCode == 401) {
      final ok = await _tryRefresh();
      if (ok) return http.post(uri, headers: defaultHeaders(), body: jsonEncode(body));
    }
    return resp;
  }

  Future<http.Response> patch(String path, Map body) async {
    final uri = Uri.parse('$baseUrl$path');
    final resp = await http.patch(uri, headers: defaultHeaders(), body: jsonEncode(body));
    if (resp.statusCode == 401) {
      final ok = await _tryRefresh();
      if (ok) return http.patch(uri, headers: defaultHeaders(), body: jsonEncode(body));
    }
    return resp;
  }

  Future<http.Response> postMultipart(String path, Map<String, String> fields, List<http.MultipartFile> files) async {
    final uri = Uri.parse('$baseUrl$path');
    final request = http.MultipartRequest('POST', uri);
    if (accessToken != null) request.headers['Authorization'] = 'Bearer $accessToken';
    request.fields.addAll(fields);
    request.files.addAll(files);
    final streamed = await request.send();
    var resp = await http.Response.fromStream(streamed);
    if (resp.statusCode == 401) {
      final ok = await _tryRefresh();
      if (ok) {
        final request2 = http.MultipartRequest('POST', uri);
        if (accessToken != null) request2.headers['Authorization'] = 'Bearer $accessToken';
        request2.fields.addAll(fields);
        request2.files.addAll(files);
        final streamed2 = await request2.send();
        resp = await http.Response.fromStream(streamed2);
      }
    }
    return resp;
  }

  Future<bool> _tryRefresh() async {
    final refresh = await _storage.read(key: 'refresh_token');
    if (refresh == null) return false;
    try {
      final uri = Uri.parse('$baseUrl/token/refresh/');
      final resp = await http.post(uri,
          headers: {'Content-Type': 'application/json'}, body: jsonEncode({'refresh': refresh}));
      if (resp.statusCode == 200) {
        final data = jsonDecode(resp.body) as Map<String, dynamic>;
        final access = data['access'] as String?;
        if (access != null) {
          accessToken = access;
          await _storage.write(key: 'access_token', value: access);
          return true;
        }
      }
    } catch (e) {
      // ignore and fall through
    }
    return false;
  }
}
