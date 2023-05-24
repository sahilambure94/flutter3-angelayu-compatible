import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

String dropdownValue = currenciesList.first;

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currentCurrency = 'AUD';
  int? btcValue;

  Map<String, String> coinValues = {};
  bool isWaiting = false;

  Future<dynamic> getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(currentCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
    // http.Response response = await http.get(Uri.parse(
    //     'https://rest.coinapi.io/v1/exchangerate/BTC/$currentCurrency?apikey=4EA8227F-06AD-4FC6-865F-E852A418D39E#'));
    // String data = response.body;
    // var decodeData = jsonDecode(data);
    // setState(() {
    //   btcValue = decodeData['rate'].toInt();
    //   currentCurrency;
    // });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Column makeCards() {
    List<CryptoCard> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        CryptoCard(
          value: isWaiting ? '?' : coinValues[crypto],
          selectedCurrency: currentCurrency,
          cryptoCurrency: crypto,
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          makeCards(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward_rounded),
              elevation: 16,
              style: TextStyle(
                color: Colors.white,
              ),
              underline: Container(
                height: 1,
                color: Colors.white,
              ),
              items:
                  currenciesList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                  print(dropdownValue);
                  currentCurrency = dropdownValue;
                  getData();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  const CryptoCard(
      {super.key, this.value, this.selectedCurrency, this.cryptoCurrency});
  final String? value;
  final String? selectedCurrency;
  final String? cryptoCurrency;
  @override
  Widget build(BuildContext context) {
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
            '1 $cryptoCurrency = $value $selectedCurrency',
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
}
