import 'package:first_app/main.dart';
import 'package:first_app/practice/product_filter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('inStockProductNames returns only the names that are in stock', () {
    final names = inStockProductNames(sampleProducts);

    expect(names, ['Checkout', 'Design system', 'Search']);
  });

  testWidgets('home screen opens the team board', (tester) async {
    await tester.pumpWidget(const FedTeamApp());

    expect(find.text('FED Team'), findsOneWidget);
    expect(find.text('Frontend Engineering Delivery'), findsOneWidget);

    await tester.tap(find.text('Meet the team'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 800));

    expect(find.text('Team Profile Board'), findsOneWidget);
    expect(find.text('Maya Chen'), findsOneWidget);

    await tester.scrollUntilVisible(find.text('Elias Ward'), 400);
    expect(find.text('Elias Ward'), findsOneWidget);
  });
}
