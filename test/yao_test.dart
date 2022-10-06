import 'package:flutter_test/flutter_test.dart';

import 'fixture.dart';

void main() {
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
