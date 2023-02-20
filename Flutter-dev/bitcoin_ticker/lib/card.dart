import 'package:flutter/material.dart';

Widget card(String cryptoName, String cryptoVal, String currencyVal) {
  return Padding(
    padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
    child: Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $cryptoName = $cryptoVal $currencyVal',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}