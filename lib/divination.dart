import 'dart:math';

import 'package:jueyi_mobile/coin.dart';
import 'package:jueyi_mobile/gua.dart';
import 'package:jueyi_mobile/yao.dart';

class Divination {
  final String question;
  late final Random random;
  final List<Yao> sixYao = [];

  Divination(this.question) {
    var tianshi = DateTime.now().millisecondsSinceEpoch * 19;
    var dili = hashCode * 13;
    var renhe = question.hashCode * 7;
    int seed = tianshi + dili + renhe;
    random = Random(seed);
    for (int i = 0; i < 6; i++) {
      sixYao.add(begAYao());
    }
  }

  @override
  String toString() {
    var result = '$question\n';

    var gua = Gua.from(sixYao);
    for (var yao in sixYao) {
      result += '\n$yao\n';
    }

    result += '\n已为您卜得一卦如下：\n';
    result += '$gua\n';

    return result;
  }

  Yao begAYao() {
    return Yao(_tossACoin(), _tossACoin(), _tossACoin());
  }

  Coin _tossACoin() {
    return random.nextBool() ? Coin.YANG : Coin.YIN;
  }
}
