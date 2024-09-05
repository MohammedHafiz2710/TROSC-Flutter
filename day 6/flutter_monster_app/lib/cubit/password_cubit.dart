import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_monster_app/cubit/Password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordState());

  bool obscureText = true;
  void changeObscure() {
    obscureText = !obscureText;
    emit(PasswordState());
  }
}
