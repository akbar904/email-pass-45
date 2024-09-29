
import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthStatus { initial, authenticated, unauthenticated }

class AuthState {
	final AuthStatus status;

	const AuthState._({required this.status});

	const AuthState.initial() : this._(status: AuthStatus.initial);

	const AuthState.authenticated() : this._(status: AuthStatus.authenticated);

	const AuthState.unauthenticated() : this._(status: AuthStatus.unauthenticated);

	@override
	bool operator ==(Object other) {
		if (identical(this, other)) return true;
		return other is AuthState && other.status == status;
	}

	@override
	int get hashCode => status.hashCode;
}
