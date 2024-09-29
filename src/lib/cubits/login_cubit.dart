
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/cubits/auth_state.dart';
import 'package:my_flutter_app/models/user.dart';

class LoginCubit extends Cubit<AuthState> {
	LoginCubit() : super(AuthInitial());

	void login(String email, String password) async {
		try {
			emit(AuthLoading());
			// Simulate network call
			await Future.delayed(Duration(seconds: 1));
			if (email == 'test@example.com' && password == 'password') {
				emit(AuthAuthenticated(user: User(email: email, name: 'Test User')));
			} else {
				emit(AuthError(message: 'Login failed'));
			}
		} catch (e) {
			emit(AuthError(message: e.toString()));
		}
	}

	void logout() async {
		try {
			emit(AuthLoading());
			// Simulate network call
			await Future.delayed(Duration(seconds: 1));
			emit(AuthInitial());
		} catch (e) {
			emit(AuthError(message: e.toString()));
		}
	}
}
