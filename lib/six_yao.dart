import 'dart:math';

import 'package:jueyi_mobile/coin.dart';
import 'package:jueyi_mobile/yao.dart';

class SixYao {
  final List<Yao> _sixYao = [];

  late final Random _random;

  SixYao.generate(seed) {
    _random = Random(seed);
    for (int position = 1; position <= 6; position++) {
      var yao = _begAYao();
      yao.position = position;
      _sixYao.add(yao);
    }
  }

  SixYao(List<Yao> sixYao) {
    for (int position = 1; position <= 6; position++) {
      var yao = sixYao[position - 1];
      yao.position = position;
      _sixYao.add(yao);
    }
  }

  int size() {
    return _sixYao.length;
  }

  Yao _begAYao() {
    return Yao(_tossACoin(), _tossACoin(), _tossACoin());
  }

  Coin _tossACoin() {
    return _random.nextBool() ? Coin.YANG : Coin.YIN;
  }

  Yao get(int position) {
    return _sixYao[position - 1];
  }

  bool matches(String lines) {
    return lines == _sixYao.map((y) => y.isYang() ? '1' : '0').join();
  }

  List<Yao> changes() {
    return _sixYao.where((y) => y.isChange()).toList(growable: false);
  }

  List<Yao> stables() {
    return _sixYao.where((y) => !(y.isChange())).toList(growable: false);
  }

  SixYao changeResult() {
    return SixYao(_sixYao.map((y) => y.reverse()).toList(growable: false));
  }

  @override
  String toString() {
    return _sixYao.map((y) => y.toString()).join('\n');
  }
}
