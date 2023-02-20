import 'card.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String bitcoinValue = '?';
  String ethValue = '?';
  String lthValue = '?';
  String listSelectedValue = currenciesList.first;
  List<DropdownMenuItem<String>> dropDownItemList() {
    List<DropdownMenuItem<String>> itemList = [];
    for (var i = 0; i < currenciesList.length; i++) {
      itemList.add(
        DropdownMenuItem(
          child: Text(currenciesList[i]),
          value: currenciesList[i],
        ),
      );
    }
    return itemList;
  }

  void updateRate() async {
    double btcval = await CoinData().getData(cryptoList[0], listSelectedValue);
    double ethval = await CoinData().getData(cryptoList[1], listSelectedValue);
    double lthval = await CoinData().getData(cryptoList[2], listSelectedValue);
    setState(() {
      bitcoinValue = btcval.toString();
      ethValue = ethval.toString();
      lthValue = lthval.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    updateRate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('🤑 Coin Ticker')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: [
              card('BTC', bitcoinValue, listSelectedValue),
              card('ETH', ethValue, listSelectedValue),
              card('LTH', lthValue, listSelectedValue),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: listSelectedValue,
              items: dropDownItemList(),
              onChanged: (value) {
                setState(() {
                  listSelectedValue = value.toString();
                  updateRate();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
