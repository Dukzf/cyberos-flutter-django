import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../services/api_service.dart';
import '../services/token_storage.dart';

class TechniciansMapScreen extends StatefulWidget {
  const TechniciansMapScreen({Key? key}) : super(key: key);

  @override
  State<TechniciansMapScreen> createState() => _TechniciansMapScreenState();
}

class _TechniciansMapScreenState extends State<TechniciansMapScreen> {
  final List<Marker> _markers = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadTechnicians();
  }

  Future<void> _loadTechnicians() async {
    final token = await TokenStorage.getAccessToken();
    if (token == null) return;

    try {
      final api = ApiService(baseUrl: 'http://localhost:8000');
      final list = await api.listTechnicians(token);
      setState(() {
        _markers.clear();
        for (final t in list) {
          final lat = (t['latitude'] ?? t['lat'])?.toDouble();
          final lng = (t['longitude'] ?? t['lng'])?.toDouble();
          if (lat != null && lng != null) {
            _markers.add(Marker(
              width: 40,
              height: 40,
              point: LatLng(lat, lng),
              builder: (ctx) => const Icon(Icons.location_on, color: Colors.red, size: 36),
            ));
          }
        }
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mapa de Técnicos')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              options: MapOptions(center: LatLng(-23.5, -46.8), zoom: 12),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(markers: _markers),
              ],
            ),
    );
  }
}
