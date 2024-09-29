
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:my_flutter_app/screens/home_screen.dart';

class MockLoginCubit extends MockCubit<void> implements LoginCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('displays a logout button', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: HomeScreen(),
				),
			);

			// Act & Assert
			expect(find.text('Logout'), findsOneWidget);
		});
	});

	group('HomeScreen Cubit Tests', () {
		late MockLoginCubit mockLoginCubit;

		setUp(() {
			mockLoginCubit = MockLoginCubit();
		});

		blocTest<MockLoginCubit, void>(
			'calls logout when the logout button is pressed',
			build: () => mockLoginCubit,
			act: (cubit) async {
				await tester.pumpWidget(
					MaterialApp(
						home: HomeScreen(),
					),
				);

				await tester.tap(find.text('Logout'));
				await tester.pump();

				verify(() => cubit.logout()).called(1);
			},
		);
	});
}
