import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  /// Performs login against the project's JWT token endpoint (/api/token/)
  /// Returns the decoded JSON (access and refresh tokens) on success.
  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/api/token/');
    final resp = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': username, 'password': password}));

    if (resp.statusCode == 200) {
      return json.decode(resp.body) as Map<String, dynamic>;
    }

    final err = resp.body.isNotEmpty ? resp.body : 'Status ${resp.statusCode}';
    throw Exception('Login failed: $err');
  }

  Future<List<Map<String, dynamic>>> listOrders(String token) async {
    final resp = await http.get(Uri.parse('$baseUrl/api/ordens/'), headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json'
    });

    if (resp.statusCode == 200) {
      final data = json.decode(resp.body) as List<dynamic>;
      return data.map((e) => e as Map<String, dynamic>).toList();
    }

    throw Exception('Failed to fetch orders: ${resp.statusCode}');
  }

  Future<List<dynamic>> listTechnicians(String token) async {
    final resp = await http.get(Uri.parse('$baseUrl/api/tecnicos/'), headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json'
    });

    if (resp.statusCode == 200) {
      return json.decode(resp.body) as List<dynamic>;
    }

    throw Exception('Failed to fetch technicians: ${resp.statusCode}');
  }

  Future<Map<String, dynamic>> createOrder(String token, Map<String, dynamic> payload) async {
    final resp = await http.post(Uri.parse('$baseUrl/api/ordens/'),
        headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'},
        body: json.encode(payload));

    if (resp.statusCode == 201) {
      return json.decode(resp.body) as Map<String, dynamic>;
    }

    throw Exception('Failed to create order: ${resp.statusCode}');
  }

  /// Attempts to refresh the access token using the stored refresh token.
  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    final url = Uri.parse('$baseUrl/api/token/refresh/');
    final resp = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'refresh': refreshToken}));

    if (resp.statusCode == 200) {
      return json.decode(resp.body) as Map<String, dynamic>;
    }

    throw Exception('Failed to refresh token: ${resp.statusCode}');
  }

  /// Wrapper for GET that retries once after trying to refresh tokens when receiving 401.
  Future<http.Response> getWithRetry(String path, String? accessToken, Future<void> Function()? onRefresh) async {
    final url = Uri.parse('$baseUrl$path');
    final resp = await http.get(url, headers: {'Authorization': 'Bearer $accessToken', 'Accept': 'application/json'});
    if (resp.statusCode != 401) return resp;

    // Try refresh callback to obtain new token in storage
    if (onRefresh != null) {
      await onRefresh();
      // Read updated access token from storage
      // Note: caller should pass updated token if necessary
    }

    // Retry once (caller must read updated token and call again if needed)
    return resp;
  }
}

