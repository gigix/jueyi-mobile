import 'package:flutter_test/flutter_test.dart';

import 'package:jueyi_mobile/yao.dart';
import 'package:jueyi_mobile/coin.dart';

void main() {
  final Yao SHAO_YANG = Yao(Coin.YANG, Coin.YIN, Coin.YIN);
  final Yao SHAO_YIN = Yao(Coin.YANG, Coin.YIN, Coin.YANG);
  final Yao LAO_YANG = Yao(Coin.YANG, Coin.YANG, Coin.YANG);
  final Yao LAO_YIN = Yao(Coin.YIN, Coin.YIN, Coin.YIN);

  test('Should know yin yang', () {
    expect(SHAO_YANG.isYang(), isTrue);
    expect(SHAO_YIN.isYang(), isFalse);
    expect(LAO_YANG.isYang(), isTrue);
    expect(LAO_YIN.isYang(), isFalse);
  });

  test('Should know lao shao', () {
    expect(SHAO_YANG.isChange(), isFalse);
    expect(SHAO_YIN.isChange(), isFalse);
    expect(LAO_YANG.isChange(), isTrue);
    expect(LAO_YIN.isChange(), isTrue);
  });
}
