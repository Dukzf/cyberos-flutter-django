class Ordem {
  final int id;
  final String numero;
  final String status;
  final String clienteNome;
  final String? tecnicoNome;
  final String dataAbertura;

  Ordem({
    required this.id,
    required this.numero,
    required this.status,
    required this.clienteNome,
    this.tecnicoNome,
    required this.dataAbertura,
  });

  factory Ordem.fromJson(Map<String, dynamic> json) {
    return Ordem(
      id: json['id'],
      numero: json['numero'].toString(),
      status: json['status'] ?? '',
      clienteNome: json['cliente'] is Map ? json['cliente']['nome'] ?? '' : (json['cliente'] ?? '').toString(),
      tecnicoNome: json['tecnico'] is Map ? json['tecnico']['nome_completo'] : (json['tecnico'] ?? null),
      dataAbertura: json['data_abertura'] ?? '',
    );
  }
}
