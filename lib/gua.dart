import 'dart:convert';

import 'package:jueyi_mobile/yao.dart';
import 'package:jueyi_mobile/all_64_gua.dart';

class Gua {
  static List<Gua> ALL_64_GUA = _readAll64GuaFromJson();

  static List<Gua> _readAll64GuaFromJson() {
    var jsonString = ALL_64_GUA_AS_JSON;
    List<dynamic> guaList = jsonDecode(jsonString);
    return guaList.map((json) => Gua._fromJson(json)).toList(growable: false);
  }

  late final int position;
  late final String name;
  late final String symbol;
  late final String lines;
  late final List<String> deducibles;
  late List<Yao> sixYao;

  static Gua from(List<Yao> sixYao) {
    var gua = ALL_64_GUA.firstWhere((g) => g._matches(sixYao));
    gua.sixYao = sixYao;
    gua.sixYao.forEach((y) => y.position = gua.sixYao.indexOf(y) + 1);
    return gua;
  }

  Gua._fromJson(json) {
    position = int.parse(json['position']);
    name = json['name'];
    symbol = json['symbol'];
    lines = json['lines'];

    List<dynamic> deduciblesList = json['deducibles'];
    deducibles = deduciblesList.map((d) => d.toString()).toList();
  }

  bool _matches(List<Yao> sixYao) {
    return lines == sixYao.map((y) => y.isYang() ? '1' : '0').join();
  }

  @override
  String toString() {
    var deducibleForGua = deducibles[0];
    var deducible = effectiveDeducible();
    return '$position. $name $symbol\n卦辞：$deducibleForGua\n断辞：$deducible';
  }

  String effectiveDeducible() {
    if (effectiveYaoPosition() == 7 && position > 2) {
      Gua changeGua = _changeGua();
      return changeGua.deducibles[0];
    }
    return deducibles[effectiveYaoPosition()];
  }

  List<Yao> _changes() {
    return sixYao.where((y) => y.isChange()).toList(growable: false);
  }

  List<Yao> _stables() {
    return sixYao.where((y) => !(y.isChange())).toList(growable: false);
  }

  int effectiveYaoPosition() {
    switch (_changes().length) {
      case 1:
        return _changes()[0].position;
      case 2:
        {
          Yao below = _changes()[0];
          Yao above = _changes()[1];
          if ((!below.isYang()) && above.isYang()) {
            return below.position;
          } else {
            return above.position;
          }
        }
      case 3:
        return _changes()[1].position;
      case 4:
      case 5:
        return _stables()[0].position;
      case 6:
        return 7;
      default:
        return 0;
    }
  }

  Gua _changeGua() {
    return from(sixYao.map((y) => y.reverse()).toList(growable: false));
  }
}
