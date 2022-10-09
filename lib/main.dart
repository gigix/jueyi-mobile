import 'package:flutter/material.dart';
import 'package:jueyi_mobile/toss_coins_page.dart';

import 'design.dart';

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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: standardPadding,
            child: TextFormField(
              controller: questionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入您要卜算之事';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: '请问您要卜算之事是……',
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(fontSize: 28),
            ),
          ),
          Padding(
            padding: standardPadding,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(80),
              ),
              onPressed: () {
                var currentState = _formKey.currentState;
                if(!currentState!.validate()) {
                  return;
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TossCoinsPage(question: questionController.text)));
              },
              child: const Text(
                '开始卜算',
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
