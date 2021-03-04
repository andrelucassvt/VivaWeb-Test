import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vivatest/Api/Api.dart';
import 'package:vivatest/Api/CarteiraIdModel.dart';
import 'package:vivatest/Views/Detalhes/Componentes/CardPosicao.dart';

class Detalhes extends StatefulWidget {
  int id;

  Detalhes({this.id});
  @override
  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  double tamanhoTexto = 17;

  //Variaveis para controlar a busca de dados da API
  var carteiraId = CarteiraIdModel();
  final _streamController = StreamController();

  //Metodo que pega os dados da API
  _getCarteiraId() {
    API.getCarteirasId(widget.id.toString()).then((response) {
      setState(() {
        Map userMap = jsonDecode(response.body);
        carteiraId = CarteiraIdModel.fromJson(userMap);
        _streamController.add(userMap);
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCarteiraId();
  }
  double conversorDaPorcentagem(){
    double valor = carteiraId.resultado * 100;
    return valor;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: Text('Detalhar'),
      ),

      body: StreamBuilder<Object>(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(
                child: CircularProgressIndicator(),
              );
              
            default: 
              if (snapshot.hasError) {
                return Center(
                  child: Text('Erro ao carregar dados :('),
                );
              } else {
                return ListView(
                  children: [
                    Container(
                      height: 100,
                      color: HexColor('#E6E6E6'),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10,top: 10),
                              child: Flexible(
                                child: AutoSizeText(
                                  carteiraId.nome,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 25),)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10,top: 8.0,),
                              child: Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Andamento:',
                                          style: TextStyle(
                                            fontSize: tamanhoTexto,
                                            color: Colors.black54
                                          ),
                                        ),
                                        TextSpan(
                                          text: carteiraId.andamento.toString(),
                                          style: TextStyle(
                                            color: Colors.purple,
                                            fontSize: tamanhoTexto
                                            )
                                        ),
                                      ]
                                    )),
                                  SizedBox(width: 10,),
                                  RichText(
                                    maxLines: 1,
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Concluidas:',
                                          style: TextStyle(
                                            fontSize: tamanhoTexto,
                                            color: Colors.black54
                                          )
                                        ),
                                        TextSpan(
                                          text: carteiraId.concluidas.toString(),
                                          style: TextStyle(
                                            color: Colors.purple,
                                            fontSize: tamanhoTexto
                                            )
                                        ),
                                      ]
                                    )),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),

                    Container(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 10),
                            child: AutoSizeText(
                              'Aporte',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.purple
                              ),
                              ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                AutoSizeText(
                                  'R\$',
                                  style: TextStyle(
                                    fontSize: 25
                                  ),
                                  ),
                                Expanded(
                                  child: AutoSizeText(
                                    carteiraId.aporte.toString(),
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 45
                                    ),
                                    ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: OutlineButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(20.0)),
                                    borderSide: BorderSide(color: Colors.purple),
                                    textColor: Colors.purple,
                                    child:Text('Editar',style: TextStyle(fontSize: 16),),
                                    onPressed: (){}
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      height: 100,
                      color: HexColor('#E6E6E6'),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 10),
                            child: AutoSizeText(
                              'Valor disponível',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.purple
                              ),
                              ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                AutoSizeText(
                                  'R\$',
                                  style: TextStyle(
                                    fontSize: 25
                                  ),
                                  ),
                                Expanded(
                                  child: AutoSizeText(
                                    carteiraId.valorDisponivel.toString(),
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 45
                                    ),
                                    ),
                                ),

                                RichText(
                                  maxLines: 1,
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Saldo total R\$: ',
                                        style: TextStyle(
                                          fontSize: tamanhoTexto,
                                          color: Colors.black54
                                        ),
                                      ),
                                      TextSpan(
                                        text: '30.000,00',
                                        style: TextStyle(
                                          color: Colors.purple,
                                          fontSize: tamanhoTexto
                                          )
                                      ),
                                    ]
                                  )),   
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 10),
                            child: AutoSizeText(
                              'Valor de mercado',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.purple
                              ),
                              ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                AutoSizeText(
                                  'R\$',
                                  style: TextStyle(
                                    fontSize: 25
                                  ),
                                  ),
                                Expanded(
                                  child: AutoSizeText(
                                    carteiraId.valorMercado.toString(),
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 45
                                    ),
                                    ),
                                ),

                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 80),
                                      child: Container(
                                        alignment: Alignment.bottomRight,
                                        height: 40,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(width: 3.0,color: Colors.teal[400])
                                        ),
                                        child: Center(
                                          child: Flexible(
                                            child: AutoSizeText(
                                              conversorDaPorcentagem().toStringAsPrecision(3)+ '%',
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.teal[400]
                                              ),
                                          )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,), 
                                    RichText(
                                      maxLines: 1,
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Saldo total R\$: ',
                                            style: TextStyle(
                                              fontSize: tamanhoTexto,
                                              color: Colors.black54
                                            ),
                                          ),
                                          TextSpan(
                                            text: '30.000,00',
                                            style: TextStyle(
                                              color: Colors.purple,
                                              fontSize: tamanhoTexto
                                              )
                                          ),
                                        ]
                                      )),
                                  ],
                                ),   
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      color: HexColor('#E6E6E6'),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 10),
                            child: AutoSizeText(
                              'Resultado',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.purple
                              ),
                              ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                AutoSizeText(
                                  'R\$',
                                  style: TextStyle(
                                    fontSize: 25
                                  ),
                                  ),
                                Expanded(
                                  child: AutoSizeText(
                                    carteiraId.valorDisponivel.toString(),
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 45
                                    ),
                                    ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 80),
                                  child: Container(
                                    alignment: Alignment.bottomRight,
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 3.0,color: Colors.teal[400])
                                    ),
                                    child: Center(
                                      child: Flexible(
                                        child: AutoSizeText(
                                          conversorDaPorcentagem().toStringAsPrecision(3) + '%',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.teal[400]
                                          ),
                                      )),
                                    ),
                                  ),
                                ),   
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: OutlineButton(
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0)),
                                borderSide: BorderSide(color: Colors.purple),
                                textColor: Colors.purple,
                                child: Center(child: Text('Exportar.CSV')),
                                onPressed: (){}
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: OutlineButton(
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0)),
                                borderSide: BorderSide(color: Colors.purple),
                                textColor: Colors.purple,
                                child: Center(child: Text('Ver extrato')),
                                onPressed: (){}
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    CardPosicao()
                  ],
                );
              }
          }

        }
      ),
    );
  }
}