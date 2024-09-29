
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/screens/login_screen.dart';

class MockLoginCubit extends MockCubit<AuthState> implements LoginCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('should display email and password fields and login button', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));

			expect(find.byType(TextField), findsNWidgets(2)); // Finds email and password text fields
			expect(find.text('Email'), findsOneWidget);
			expect(find.text('Password'), findsOneWidget);
			expect(find.text('Login'), findsOneWidget);
		});

		testWidgets('should show error message when login fails', (WidgetTester tester) async {
			final mockLoginCubit = MockLoginCubit();
			whenListen(mockLoginCubit, Stream.fromIterable([AuthState.error('Login Failed')]));

			await tester.pumpWidget(MaterialApp(
				home: BlocProvider(
					create: (_) => mockLoginCubit,
					child: LoginScreen(),
				),
			));
			
			await tester.pump();

			expect(find.text('Login Failed'), findsOneWidget);
		});
	});

	group('LoginCubit Tests', () {
		late MockLoginCubit mockLoginCubit;

		setUp(() {
			mockLoginCubit = MockLoginCubit();
		});

		blocTest<MockLoginCubit, AuthState>(
			'emits [AuthState.loading, AuthState.authenticated] when login is successful',
			build: () => mockLoginCubit,
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [
				AuthState.loading(),
				AuthState.authenticated(User(email: 'test@example.com', name: 'Test User'))
			],
		);

		blocTest<MockLoginCubit, AuthState>(
			'emits [AuthState.loading, AuthState.error] when login fails',
			build: () => mockLoginCubit,
			act: (cubit) => cubit.login('test@example.com', 'wrongpassword'),
			expect: () => [
				AuthState.loading(),
				AuthState.error('Invalid credentials')
			],
		);
	});
}
