import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_monster_app/cubit/password_cubit.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  bool obscureText;
  final String? Function(String?) validator;
  MyTextField({
    super.key,
    required this.label,
    required this.keyboardType,
    required this.obscureText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color(0xFFF8FE11),
      keyboardType: keyboardType,
      style: const TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: keyboardType == TextInputType.visiblePassword
            ? IconButton(
                onPressed: () {
                  BlocProvider.of<PasswordCubit>(context).changeObscure();
                },
                icon: Icon(
                  BlocProvider.of<PasswordCubit>(context).obscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: const Color(0xFF808696),
                ),
              )
            : null,
        label: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF808696),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFF8FE11),
          ),
        ),
      ),
      validator: validator,
    );
  }
}
