
import 'package:jueyi_mobile/gua.dart';
import 'package:jueyi_mobile/six_yao.dart';

class Divination {
  final String _question;
  late final SixYao _sixYao;

  Divination(this._question) {
    var tianshi = DateTime.now().millisecondsSinceEpoch * 19;
    var dili = hashCode * 13;
    var renhe = _question.hashCode * 7;
    _sixYao = SixYao.generate(tianshi + dili + renhe);
  }

  String sixYaoToString() {
    return _sixYao.toString();
  }

  String guaToString() {
    return Gua.from(_sixYao).toString();
  }
}
