import 'package:flutter_test/flutter_test.dart';

import 'package:jueyi_mobile/gua.dart';

import 'fixture.dart';

void main() {
  test('Should have 64 distinct Gua', () {
    expect(Gua.ALL_64_GUA.length, 64);
    expect(Gua.ALL_64_GUA.map((g) => g.lines).toSet().length, 64);
  });
  
  test('Should create Gua with 6 Yao', () {
    Gua qian = Gua.from([SHAO_YANG, SHAO_YANG, SHAO_YANG, SHAO_YANG, SHAO_YANG, SHAO_YANG]);
    expect(qian.position, 1);

    Gua guimei = Gua.from([SHAO_YANG, SHAO_YANG, SHAO_YIN, LAO_YANG, SHAO_YIN, SHAO_YIN]);
    expect(guimei.position, 54);
    expect(guimei.name, '归妹');
  });
}