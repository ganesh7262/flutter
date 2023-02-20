import 'networking.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  static String apiKey = '03B46BDF-4770-4269-8106-AF9F26E01954';

  Future getData(String asset_id_base, String asset_id_quote) async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://rest.coinapi.io/v1/exchangerate/$asset_id_base/$asset_id_quote?apikey=$apiKey');

    var rateData = await networkHelper.getData();
    // print(rateData['rate']);
    return rateData['rate'];
  }
}
