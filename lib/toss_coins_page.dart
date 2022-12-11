import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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
              child: Text(divination.sixYaoToString(),
                  style: standardTextStyle(16)),
            ),
            Padding(
              padding: standardPadding,
              child: Text(divination.guaTitleAsText(),
                  style: standardTextStyle(64)),
            ),
            Padding(
              padding: standardPadding,
              child: Text(divination.guaDeduciblesAsText(),
                  style: standardTextStyle(16)),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 140),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(80),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: Text(
                            divination.guaTitleAsText(),
                            style: const TextStyle(fontFamily: 'DejaVuSans'),
                          ),
                          children: <Widget>[
                            FutureBuilder<String>(
                                future: divination.guaDescription(),
                                builder: (context, snapshot) {
                                  return Container(
                                    padding: standardPadding,
                                    child: MarkdownBody(
                                      data: '${snapshot.data}',
                                    ),
                                  );
                                })
                          ],
                        );
                      });
                },
                child: const Text(
                  '查看周易解卦',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
              child: Image.asset(
                'asset/images/link_to_website.png',
                width: 100,
              ),
            ),
            const Text('扫码下载易·决疑APP')
          ],
        ),
      ),
    );
  }
}
