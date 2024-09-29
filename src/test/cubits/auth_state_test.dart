
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.my_flutter_app/cubits/auth_state.dart';

class MockAuthState extends Mock implements AuthState {}

void main() {
	group('AuthState Cubit Tests', () {
		late AuthState authState;

		setUp(() {
			authState = MockAuthState();
		});

		blocTest<AuthState, AuthState>(
			'Initial state should be AuthState.initial()',
			build: () => authState,
			verify: (cubit) => expect(cubit.state, equals(AuthState.initial())),
		);

		blocTest<AuthState, AuthState>(
			'Emits AuthState.authenticated when login is successful',
			build: () => authState,
			act: (cubit) => cubit.emit(AuthState.authenticated()),
			expect: () => [AuthState.authenticated()],
		);

		blocTest<AuthState, AuthState>(
			'Emits AuthState.unauthenticated when logout is successful',
			build: () => authState,
			act: (cubit) => cubit.emit(AuthState.unauthenticated()),
			expect: () => [AuthState.unauthenticated()],
		);
	});
}
