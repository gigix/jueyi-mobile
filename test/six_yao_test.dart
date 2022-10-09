import 'package:flutter_test/flutter_test.dart';
import 'package:jueyi_mobile/six_yao.dart';
import 'package:jueyi_mobile/yao.dart';

void main() {
  var sixYao = SixYao.generate(1);

  test("Should be able to create 6 Yao with a random seed", () {
    expect(sixYao.size(), 6);
  });

  test('Should set positions properly', () {
    Yao first = sixYao.get(1);
    expect(first.position, 1);
  });
}
