import 'package:flutter_test/flutter_test.dart';
import 'package:project_expenses/main.dart';
import 'package:project_expenses/components/transaction_user.dart';

void main() {
  testWidgets('App renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ExpensesApp());

    // Verify that the title is displayed correctly.
    expect(find.text('Despesas Pessoais'), findsOneWidget);

    // Verify that the graph card is displayed.
    expect(find.text('Gráfico'), findsOneWidget);

    // Verify that the TransactionUser widget is displayed.
    expect(find.byType(TransactionUser), findsOneWidget);
  });
}
