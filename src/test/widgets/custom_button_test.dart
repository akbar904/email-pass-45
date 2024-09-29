
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

void main() {
	group('CustomButton Widget Tests', () {
		testWidgets('CustomButton displays correct text', (WidgetTester tester) async {
			// Arrange
			const buttonText = 'Login';

			// Act
			await tester.pumpWidget(
				const MaterialApp(
					home: Scaffold(
						body: CustomButton(
							text: buttonText,
							onPressed: null,
						),
					),
				),
			);

			// Assert
			expect(find.text(buttonText), findsOneWidget);
		});

		testWidgets('CustomButton triggers onPressed callback when tapped', (WidgetTester tester) async {
			// Arrange
			bool wasPressed = false;
			const buttonText = 'Login';

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: CustomButton(
							text: buttonText,
							onPressed: () {
								wasPressed = true;
							},
						),
					),
				),
			);

			// Tap the button
			await tester.tap(find.text(buttonText));
			await tester.pump();

			// Assert
			expect(wasPressed, isTrue);
		});

		testWidgets('CustomButton is disabled when onPressed is null', (WidgetTester tester) async {
			// Arrange
			const buttonText = 'Login';

			// Act
			await tester.pumpWidget(
				const MaterialApp(
					home: Scaffold(
						body: CustomButton(
							text: buttonText,
							onPressed: null,
						),
					),
				),
			);

			// Tap the button
			await tester.tap(find.text(buttonText));
			await tester.pump();

			// Assert
			expect(
				tester.widget<ElevatedButton>(find.byType(ElevatedButton)).enabled,
				isFalse,
			);
		});
	});
}
