import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:jueyi_mobile/six_yao.dart';
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
  late SixYao _sixYao;

  static Gua from(SixYao sixYao) {
    var gua = ALL_64_GUA.firstWhere((g) => g._matches(sixYao));
    gua._sixYao = sixYao;
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

  bool _matches(SixYao sixYao) {
    return sixYao.matches(lines);
  }

  String effectiveDeducible() {
    if (effectiveYaoPosition() == 7 && position > 2) {
      Gua changeGua = _changeGua();
      return changeGua.deducibles[0];
    }
    return deducibles[effectiveYaoPosition()];
  }

  List<Yao> _changes() {
    return _sixYao.changes();
  }

  List<Yao> _stables() {
    return _sixYao.stables();
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
    return from(_sixYao.changeResult());
  }

  String titleText() {
    return '$position. $name $symbol';
  }

  String deduciblesText() {
    var deducibleForGua = deducibles[0];
    var deducible = effectiveDeducible();
    return '卦辞：$deducibleForGua\n断辞：$deducible';
  }

  Future<String> description() async {
    return rootBundle.loadString('asset/text/${position.toString().padLeft(2, '0')}.md');
  }
}
