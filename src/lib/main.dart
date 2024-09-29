
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/login_screen.dart';
import 'cubits/login_cubit.dart';
import 'cubits/auth_state.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MultiBlocProvider(
			providers: [
				BlocProvider<LoginCubit>(
					create: (context) => LoginCubit(),
				),
			],
			child: MaterialApp(
				title: 'My Flutter App',
				theme: ThemeData(
					primarySwatch: Colors.blue,
				),
				home: LoginScreen(),
			),
		);
	}
}
