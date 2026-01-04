import 'package:flutter_test/flutter_test.dart';
import 'package:parallax/main.dart';
import 'package:parallax/screens/parallax_home.dart';

void main() {
  testWidgets('Parallax explorer test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(ParallaxHome), findsOneWidget);
  });
}
