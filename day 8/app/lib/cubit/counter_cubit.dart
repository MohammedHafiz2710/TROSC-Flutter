import 'package:flutter_application_1/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterAIncrement());

  int temAPoints = 0;
  int temBPoints = 0;
  void teamAIncrement({required String team, required int buttonNum}) {
    if (team == 'A') {
      temAPoints += buttonNum;
      emit(CounterAIncrement());
    } else {
      temBPoints += buttonNum;
      emit(CounterBIncrement());
    }
  }

  void reset() {
    temAPoints = 0;
    temBPoints = 0;
    emit(ResetButton());
  }
}
