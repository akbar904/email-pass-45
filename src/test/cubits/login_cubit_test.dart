
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/cubits/login_cubit.dart';
import 'package:my_flutter_app/cubits/auth_state.dart';

class MockLoginCubit extends MockCubit<AuthState> implements LoginCubit {}

void main() {
	group('LoginCubit', () {
		late LoginCubit loginCubit;

		setUp(() {
			loginCubit = LoginCubit();
		});

		tearDown(() {
			loginCubit.close();
		});

		test('initial state is AuthInitial', () {
			expect(loginCubit.state, equals(AuthInitial()));
		});

		blocTest<LoginCubit, AuthState>(
			'emits [AuthLoading, AuthAuthenticated] when login is successful',
			build: () => loginCubit,
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [
				AuthLoading(),
				AuthAuthenticated(user: User(email: 'test@example.com', name: 'Test User')),
			],
		);

		blocTest<LoginCubit, AuthState>(
			'emits [AuthLoading, AuthError] when login fails',
			build: () => loginCubit,
			act: (cubit) => cubit.login('wrong@example.com', 'wrongpassword'),
			expect: () => [
				AuthLoading(),
				AuthError(message: 'Login failed'),
			],
		);

		blocTest<LoginCubit, AuthState>(
			'emits [AuthLoading, AuthInitial] when logout is called',
			build: () => loginCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [
				AuthLoading(),
				AuthInitial(),
			],
		);
	});
}
