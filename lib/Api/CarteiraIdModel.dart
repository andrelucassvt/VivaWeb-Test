class CarteiraIdModel {
  String nome;
  int andamento;
  int concluidas;
  int aporte;
  int valorDisponivel;
  int valorMercado;
  double resultado;
  int id;

  CarteiraIdModel(
      {this.nome,
      this.andamento,
      this.concluidas,
      this.aporte,
      this.valorDisponivel,
      this.valorMercado,
      this.resultado,
      this.id});

  CarteiraIdModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    andamento = json['andamento'];
    concluidas = json['concluidas'];
    aporte = json['aporte'];
    valorDisponivel = json['valorDisponivel'];
    valorMercado = json['valorMercado'];
    resultado = json['resultado'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['andamento'] = this.andamento;
    data['concluidas'] = this.concluidas;
    data['aporte'] = this.aporte;
    data['valorDisponivel'] = this.valorDisponivel;
    data['valorMercado'] = this.valorMercado;
    data['resultado'] = this.resultado;
    data['id'] = this.id;
    return data;
  }
}