import 'package:flutter_test/flutter_test.dart';

import 'package:jueyi_mobile/divination.dart';
import 'package:jueyi_mobile/yao.dart';

void main() {
  var divination = Divination('A random question');

  test('Divination can be created with a question', () {
    expect(divination.toString(), isNotEmpty);
  });

  test('Should toss 3 coins to get a random Yao', () {
    Yao yao = divination.begAYao();
    print(yao);
  });

}