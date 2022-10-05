import 'package:jueyi_mobile/coin.dart';

class Yao {
  final List<Coin> coins = [];

  Yao(Coin coin1, Coin coin2, Coin coin3) {
    coins.addAll([coin1, coin2, coin3]);
  }

  bool isYang() {
    return coins.where((coin) => coin.isYang).length % 2 == 1;
  }

  bool isChange() {
    return coins.toSet().length == 1;
  }

  @override
  String toString() {
    var result = '抛出三枚铜板：';
    for (var i = 1; i <= coins.length; i++) {
      var coinToString = coins[i-1].toString();
      result += '$coinToString ';
    }
    result += '\n本爻结果：';
    result += isChange() ? '老' : '少';
    result += isYang() ? "阳" : "阴";
    return result;
  }
}
