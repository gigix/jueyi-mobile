class Coin {
  static const Coin YIN = Coin(false);
  static const Coin YANG = Coin(true);

  final bool isYang;

  const Coin(this.isYang);

  @override
  String toString() {
    return isYang ? '正' : '反';
  }
}