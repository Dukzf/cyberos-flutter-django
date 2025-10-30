import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapaTecnicosPage extends StatelessWidget {
  const MapaTecnicosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mapa de Técnicos')),
      body: FlutterMap(
        options: MapOptions(center: LatLng(-23.5, -46.6), zoom: 12),
        children: [
          TileLayer(urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', subdomains: const ['a', 'b', 'c']),
          MarkerLayer(markers: [Marker(point: LatLng(-23.5, -46.6), width: 80, height: 80, builder: (ctx) => const Icon(Icons.person))])
        ],
      ),
    );
  }
}
