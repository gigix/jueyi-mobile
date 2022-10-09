import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('正在为您卜算……')),
      body: Center(
        child: Text(Divination(question).toString(),
            style: const TextStyle(fontFamily: 'DejaVuSans', fontSize: 16)),
      ),
    );
  }
}
