import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:jueyi_mobile/yao.dart';

class Gua {
  static List<Gua> ALL_64_GUA = _readAll64GuaFromJsonFile();

  static List<Gua> _readAll64GuaFromJsonFile() {
    var jsonString = File('lib/64gua.json').readAsStringSync();
    List<dynamic> guaList = jsonDecode(jsonString);
    return guaList.map((json) => Gua._fromJson(json)).toList(growable: false);
  }

  late final int position;
  late final String name;
  late final String symbol;
  late final List<int> lines;
  late final List<String> deducibles;

  Gua.from(Yao yao1, Yao yao2, Yao yao3, Yao yao4, Yao yao5, Yao yao6) {}

  Gua._fromJson(json) {
    position = int.parse(json['position']);
    name = json['name'];
    symbol = json['symbol'];
    lines =
        json['lines'].toString().characters.map((c) => int.parse(c)).toList();

    List<dynamic> deduciblesList = json['deducibles'];
    deducibles = deduciblesList.map((d) => d.toString()).toList();
  }
}
