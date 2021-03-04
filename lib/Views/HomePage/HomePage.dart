import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vivatest/Api/Api.dart';
import 'package:vivatest/Api/CarteiraModel.dart';
import 'package:vivatest/Views/HomePage/Componentes/Container.dart';

import 'Componentes/AppBarHome.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Variaveis para controlar a busca de dados da API
  var carteiras = List<CarteiraModel>();
  final _streamController = StreamController<List>();
  

  //Metodo que pega os dados da API
  _getCarteiras() {
    API.getCarteiras().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        carteiras = lista.map((e) => CarteiraModel.fromJson(e)).toList();
        _streamController.add(lista);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCarteiras();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F2F2F2'),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 56),
          child: AppBarHome()),

      body: StreamBuilder<Object>(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text('Erro ao carregar dados :('),
                );
              } else {
                return SafeArea(
                  child: ListView.builder(
                    itemCount: carteiras.length,
                    itemBuilder: (context,index){
                      return CardInfo(
                        id: carteiras[index].id,
                        nome: carteiras[index].nome,
                        andamento: carteiras[index].andamento,
                        aporte: carteiras[index].aporte,
                        concluidas: carteiras[index].concluidas,
                        resultado: carteiras[index].resultado,
                        valor: carteiras[index].valor,
                      );
                    },
                  ),
                );
              }
          }
        }
      ),
    );
  }
}
