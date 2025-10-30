import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class RelatoriosPage extends StatelessWidget {
  const RelatoriosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Relatórios')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          const Text('Exemplo de gráfico'),
          SizedBox(
            height: 200,
            child: LineChart(LineChartData(lineBarsData: [LineChartBarData(spots: [FlSpot(0, 1), FlSpot(1, 3), FlSpot(2, 2)])])),
          )
        ]),
      ),
    );
  }
}
