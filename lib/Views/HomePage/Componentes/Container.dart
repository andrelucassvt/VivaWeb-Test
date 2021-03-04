import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vivatest/Views/Detalhes/Detalhes.dart';

class CardInfo extends StatelessWidget {
  int id;
  String nome;
  int andamento;
  int concluidas;
  int valor;
  double resultado;
  int aporte;

  CardInfo({this.id,this.nome,this.andamento,this.aporte,this.concluidas,this.resultado,this.valor});

  double tamanhoTexto = 17;

  double conversorDaPorcentagem(){
    double valor = resultado * 100;
    return valor;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: HexColor('#E6E6E6'),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10),
              child: Flexible(
                child: AutoSizeText(
                  nome,
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
                          text: andamento.toString(),
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
                          text: concluidas.toString(),
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: tamanhoTexto
                            )
                        ),
                      ]
                    )),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: OutlineButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.purple),
                        textColor: Colors.purple,
                        child:Text('Detalhar',style: TextStyle(fontSize: 16),),
                        onPressed: (){
                          print(id);
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> Detalhes(id: id,))
                          );
                        }),
                  )
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                color: HexColor('ffffff'),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
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
                              valor.toString(),
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 45
                              ),
                              ),
                          ),
                          Container(
                            height: 66,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 3.0,color: Colors.teal[400])
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: AutoSizeText(
                                    'RESULTADO ATUAL',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.teal[400]
                                      ),
                                    maxLines: 1,
                                    )),
                                Flexible(
                                  child: AutoSizeText(
                                    conversorDaPorcentagem().toStringAsPrecision(3) + '%',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.teal[400]
                                    ),
                                )),


                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 40,
                        color: HexColor('#E6E6E6'),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText('Aporte inicial'),
                              AutoSizeText('R\$: $aporte'),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),


              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: HexColor('#E6E6E6'),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'Ações',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 20
                      ),
                      ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 30,
                      )
                  ],
                ),
              )
            
          ],
        ),
      ),
    );
  }
}