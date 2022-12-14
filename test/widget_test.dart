import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:jueyi_mobile/main.dart';

void main() {
  final TestWidgetsFlutterBinding binding = TestWidgetsFlutterBinding.ensureInitialized();
  // final TestNavigatorObserver _navObserver;

  testWidgets('Should smoke', (WidgetTester tester) async {
    await binding.setSurfaceSize(const Size(640, 640));

    await tester.pumpWidget(const JueyiApp());
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.textContaining('请输入您要卜算之事'), findsOneWidget);

    var question = 'A test question';
    await tester.enterText(find.byType(TextFormField), question);
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // TODO: how to assert text of AppBar?
    // expect(find.textContaining('为您卜算：$question'), findsOneWidget);
    expect(find.textContaining('抛出三枚铜板'), findsOneWidget);
  });
}
