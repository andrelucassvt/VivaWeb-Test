import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarHome extends StatefulWidget {
  @override
  _AppBarHomeState createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> {
  String dropdownValue = 'Minha carteira';
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple[700],
      actions: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
            color: Colors.white24,
            child: DropdownButton(
              value: dropdownValue,
              isExpanded: true,
              iconEnabledColor: Colors.white,
              icon: Icon(Icons.keyboard_arrow_down_rounded),
              iconSize: 24,
              elevation: 16,
              underline: Container(
                color: Colors.transparent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['Minha carteira', '']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: TextStyle(color: Colors.white),),
                );
              }).toList(),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(15.0),
          child: OutlineButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              borderSide: BorderSide(color: Colors.white),
              textColor: Colors.white,
              child: Row(
                children: [
                  Icon(Icons.account_balance_wallet_rounded),
                  SizedBox(width: 5,),
                  Text('Nova carteira'),
                ],
              ),
              onPressed: (){}),
        )
      ],
    );
  }
}
