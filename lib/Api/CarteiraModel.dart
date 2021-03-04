class CarteiraModel {
  int id;
  String nome;
  int andamento;
  int concluidas;
  int valor;
  double resultado;
  int aporte;

  CarteiraModel(
      {this.id,
      this.nome,
      this.andamento,
      this.concluidas,
      this.valor,
      this.resultado,
      this.aporte});

  CarteiraModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    andamento = json['andamento'];
    concluidas = json['concluidas'];
    valor = json['valor'];
    resultado = json['resultado'];
    aporte = json['aporte'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['andamento'] = this.andamento;
    data['concluidas'] = this.concluidas;
    data['valor'] = this.valor;
    data['resultado'] = this.resultado;
    data['aporte'] = this.aporte;
    return data;
  }
}