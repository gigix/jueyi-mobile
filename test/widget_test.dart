import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:jueyi_mobile/main.dart';

void main() {
  final TestWidgetsFlutterBinding binding = TestWidgetsFlutterBinding.ensureInitialized();
  // final TestNavigatorObserver _navObserver;

  testWidgets('Should smoke', (WidgetTester tester) async {
    await binding.setSurfaceSize(const Size(640, 640));

    var question = 'A test question';
    await tester.pumpWidget(const JueyiApp());
    await tester.enterText(find.byType(TextFormField), question);
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // TODO: how to assert text of AppBar?
    // expect(find.textContaining('为您卜算：$question'), findsOneWidget);
    expect(find.textContaining('已为您卜得一卦'), findsOneWidget);
  });
}
