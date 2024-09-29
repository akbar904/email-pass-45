
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/login_cubit.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
	@override
	_LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
	final TextEditingController _emailController = TextEditingController();
	final TextEditingController _passwordController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: BlocListener<LoginCubit, AuthState>(
				listener: (context, state) {
					if (state is AuthStateError) {
						ScaffoldMessenger.of(context).showSnackBar(
							SnackBar(content: Text(state.message)),
						);
					}
				},
				child: Padding(
					padding: const EdgeInsets.all(16.0),
					child: Column(
						children: <Widget>[
							TextField(
								controller: _emailController,
								decoration: InputDecoration(labelText: 'Email'),
							),
							TextField(
								controller: _passwordController,
								decoration: InputDecoration(labelText: 'Password'),
								obscureText: true,
							),
							SizedBox(height: 20),
							CustomButton(
								text: 'Login',
								onPressed: () {
									final email = _emailController.text;
									final password = _passwordController.text;
									context.read<LoginCubit>().login(email, password);
								},
							),
						],
					),
				),
			),
		);
	}

	@override
	void dispose() {
		_emailController.dispose();
		_passwordController.dispose();
		super.dispose();
	}
}
