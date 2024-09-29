
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/main.dart';

class MockLoginCubit extends MockCubit<AuthState> implements LoginCubit {}

void main() {
	group('MyApp Widget Tests', () {
		testWidgets('MyApp contains MaterialApp', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(MaterialApp), findsOneWidget);
		});
	});

	group('Main Function Tests', () {
		test('main initializes the app correctly', () async {
			// Assuming the main function just runs the MyApp widget
			TestWidgetsFlutterBinding.ensureInitialized();
			main();
			await tester.pump();

			expect(find.byType(MyApp), findsOneWidget);
		});
	});
}
