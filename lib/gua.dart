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

  static Gua from(List<Yao> sixYao) {
    return ALL_64_GUA.firstWhere((gua) => gua._matches(sixYao));
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
    var effectiveDeducible = _effectiveDeducible();
    return '$position. $name $symbol\n卦辞：$deducibleForGua\n断辞：$effectiveDeducible';
  }

  String _effectiveDeducible() {
    return deducibles[1];
  }
}
