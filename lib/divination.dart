import 'dart:math';

import 'package:jueyi_mobile/coin.dart';
import 'package:jueyi_mobile/yao.dart';

class Divination {
  final String question;
  late final Random random;
  final List<Yao> yaos = [];

  Divination(this.question) {
    int seed =
        question.hashCode * 7 + DateTime.now().millisecondsSinceEpoch * 11;
    random = Random(seed);
    for (int i = 0; i < 6; i++) {
      yaos.add(begAYao());
    }
  }

  @override
  String toString() {
    var result = '为您卜算：$question\n';
    for (var yao in yaos) {
      result += '\n$yao\n';
    }
    return result;
  }

  Yao begAYao() {
    return Yao(_tossACoin(), _tossACoin(), _tossACoin());
  }

  Coin _tossACoin() {
    return random.nextBool() ? Coin.YANG : Coin.YIN;
  }
}
