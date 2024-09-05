import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_monster_app/cubit/password_cubit.dart';

import 'my_sized_box.dart';
import 'my_text_field.dart';

class AuthFields extends StatelessWidget {
  final formKey;
  const AuthFields({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          MyTextField(
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          mySizedBox(height: 24),
          MyTextField(
            label: 'Password',
            keyboardType: TextInputType.visiblePassword,
            obscureText: BlocProvider.of<PasswordCubit>(context).obscureText,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
