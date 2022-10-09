import 'package:flutter/material.dart';
import 'package:jueyi_mobile/design.dart';

import 'package:jueyi_mobile/divination.dart';

class TossCoinsPage extends StatefulWidget {
  final String question;

  const TossCoinsPage({super.key, required this.question});

  @override
  State<TossCoinsPage> createState() => _TossCoinPageState(question);
}

class _TossCoinPageState extends State<TossCoinsPage> {
  final String question;

  _TossCoinPageState(this.question);

  @override
  Widget build(BuildContext context) {
    var divination = Divination(question);

    return Scaffold(
      appBar: AppBar(title: const Text('正在为您卜算……')),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: standardPadding,
              child: Text(question, style: standardTextStyle(24)),
            ),
            Padding(
              padding: standardPadding,
              child: Text(divination.sixYaoToString(), style: standardTextStyle(16)),
            ),
            Padding(
              padding: standardPadding,
              child: Text(divination.guaToString(), style: standardTextStyle(16)),
            ),
          ],
        ),
      ),
    );
  }
}
