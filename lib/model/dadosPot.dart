class Dados {
  String mes;
  int valor;

  Dados(this.mes, this.valor);

  Dados.fromJson(Map<String, dynamic> json) {
    mes = json['mes'];
    valor = json['valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mes'] = this.mes;
    data['valor'] = this.valor;
    return data;
  }
}