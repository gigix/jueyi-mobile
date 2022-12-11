import 'package:flutter_test/flutter_test.dart';

import 'package:jueyi_mobile/gua.dart';
import 'package:jueyi_mobile/six_yao.dart';

import 'fixture.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Should have 64 distinct Gua', () {
    expect(Gua.ALL_64_GUA.length, 64);
    expect(Gua.ALL_64_GUA.map((g) => g.lines).toSet().length, 64);
  });
  
  test('Should create Gua with 6 Yao', () {
    Gua qian = Gua.from(SixYao([SHAO_YANG, SHAO_YANG, SHAO_YANG, SHAO_YANG, SHAO_YANG, SHAO_YANG]));
    expect(qian.position, 1);

    Gua guimei = Gua.from(SixYao([SHAO_YANG, SHAO_YANG, SHAO_YIN, LAO_YANG, SHAO_YIN, SHAO_YIN]));
    expect(guimei.position, 54);
    expect(guimei.name, '归妹');
  });

  test('Should know effective Yao position', () {
    Gua qian = Gua.from(SixYao([SHAO_YANG, SHAO_YANG, SHAO_YANG, SHAO_YANG, SHAO_YANG, SHAO_YANG]));
    expect(qian.effectiveYaoPosition(), 0);

    Gua qian1 = Gua.from(SixYao([LAO_YANG, SHAO_YANG, SHAO_YANG, SHAO_YANG, SHAO_YANG, SHAO_YANG]));
    expect(qian1.effectiveYaoPosition(), 1);
    expect(qian1.effectiveDeducible(), '初九：潜龙勿用。');

    // ䷵
    Gua guimei2 = Gua.from(SixYao([SHAO_YANG, SHAO_YANG, LAO_YIN, LAO_YANG, SHAO_YIN, SHAO_YIN]));
    expect(guimei2.effectiveYaoPosition(), 3);

    Gua guimei3 = Gua.from(SixYao([SHAO_YANG, SHAO_YANG, LAO_YIN, LAO_YANG, LAO_YIN, SHAO_YIN]));
    expect(guimei3.effectiveYaoPosition(), 4);

    Gua guimei4 = Gua.from(SixYao([SHAO_YANG, LAO_YANG, LAO_YIN, LAO_YANG, LAO_YIN, SHAO_YIN]));
    expect(guimei4.effectiveYaoPosition(), 1);

    Gua guimei5 = Gua.from(SixYao([LAO_YANG, LAO_YANG, LAO_YIN, LAO_YANG, SHAO_YIN, LAO_YIN]));
    expect(guimei5.effectiveYaoPosition(), 5);
  });

  test('Should deal with 6 change Yao', () {
    Gua qian = Gua.from(SixYao([LAO_YANG, LAO_YANG, LAO_YANG, LAO_YANG, LAO_YANG, LAO_YANG]));
    expect(qian.effectiveYaoPosition(), 7);
    expect(qian.effectiveDeducible(), '用九：见群龙无首，吉。');

    Gua kun = Gua.from(SixYao([LAO_YIN, LAO_YIN, LAO_YIN, LAO_YIN, LAO_YIN, LAO_YIN]));
    expect(kun.effectiveYaoPosition(), 7);
    expect(kun.effectiveDeducible(), '用六：利永贞。');

    // // ䷋ 否：否极泰来
    Gua pi = Gua.from(SixYao([LAO_YIN, LAO_YIN, LAO_YIN, LAO_YANG, LAO_YANG, LAO_YANG]));
    expect(pi.effectiveYaoPosition(), 7);
    expect(pi.effectiveDeducible(), '小往大来，吉亨。');
  });

  test('Should have description as text', () async {
    Gua qian = Gua.from(SixYao([SHAO_YANG, SHAO_YANG, SHAO_YANG, SHAO_YANG, SHAO_YANG, SHAO_YANG]));
    expectLater(qian.description(), completion(contains('乾，元亨利贞。')));

    Gua guimei = Gua.from(SixYao([SHAO_YANG, SHAO_YANG, SHAO_YIN, LAO_YANG, SHAO_YIN, SHAO_YIN]));
    expectLater(guimei.description(), completion(contains('归妹，征凶，无攸利。')));
  });
}