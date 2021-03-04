import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CardPosicao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: HexColor('#E6E6E6'),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: AutoSizeText(
                    'Posições',
                    maxLines: 1,
                    style: GoogleFonts.rubik(
                      color: Colors.purple,
                      fontSize: 25
                    ),
                  ),
                ),

                OutlineButton(
                  shape: new RoundedRectangleBorder(
                      
                      borderRadius: new BorderRadius.circular(30.0)),
                  borderSide: BorderSide(color: Colors.purple),
                  textColor: Colors.purple,
                  child: Center(child: Text('Adicionar posições')),
                  onPressed: (){}
                ),
              ],
            ),
          ),

          
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  child: Center(
                    child: AutoSizeText(
                      'Abertas',
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.purple
                  ),
                  child: Center(
                    child: AutoSizeText(
                      'Fechadas',
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              height: 100,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  color: Colors.purple[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.warning,
                        color: HexColor('#800080')
                        ),
                      AutoSizeText(
                        'Não há papéis encontrados nesse período',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 15,
                          color: HexColor('#800080')
                        ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}