
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/cubits/login_cubit.dart';
import 'package:my_flutter_app/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final loginCubit = context.read<LoginCubit>();

		return Scaffold(
			appBar: AppBar(
				title: Text('Home'),
			),
			body: Center(
				child: CustomButton(
					text: 'Logout',
					onPressed: () {
						loginCubit.logout();
					},
				),
			),
		);
	}
}
