import 'package:flutter/material.dart';
import 'package:jueyi_mobile/toss_coins_page.dart';

import 'divination.dart';

void main() {
  runApp(const JueyiApp());
}

class JueyiApp extends StatelessWidget {
  const JueyiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '易决疑',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('易经卜卦决疑'),
        ),
        body: const JueyiPage(),
      ),
    );
  }
}

class JueyiPage extends StatefulWidget {
  const JueyiPage({super.key});

  @override
  State<JueyiPage> createState() => _JueyiPageState();
}

class _JueyiPageState extends State<JueyiPage> {
  final _formKey = GlobalKey<FormState>();
  final questionController = TextEditingController();
  String resultText = '';

  @override
  Widget build(BuildContext context) {
    const standardPadding = EdgeInsets.symmetric(vertical: 16, horizontal: 8);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: standardPadding,
            child: TextFormField(
              controller: questionController,
              decoration: const InputDecoration(
                hintText: '请问您要卜算之事是……',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: standardPadding,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => TossCoinsPage(question: questionController.text)));
              },
              child: const Text('开始卜算'),
            ),
          ),
          Padding(
            padding: standardPadding,
            child:
            Text(resultText, style: const TextStyle(fontFamily: 'DejaVuSans')),
          )
        ],
      ),
    );
  }

}
