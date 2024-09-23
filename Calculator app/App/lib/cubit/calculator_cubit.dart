import 'package:bloc/bloc.dart';
import 'package:calc/cubit/calculator_state.dart';
import 'package:function_tree/function_tree.dart';

class CalculatorCubit extends Cubit<CalcState> {
  CalculatorCubit() : super(const CalcInitial('0'));

  void setOutput(String value) {
    String output = state.output;

    switch (value) {
      case "=":
        calculate();
        return;
      case "C":
        output = "0";
        break;
      case "del":
        if (output.length > 1) {
          output = output.substring(0, output.length - 1);
        } else {
          output = "0";
        }
        break;
      case "x":
        output += "x";
        break;
      case "()":
        output = output.contains("(") ? "$output)" : "$output(";
        break;
      default:
        if (output == "0" && value != "C" && value != "del") {
          output = value;
        } else {
          output += value;
        }
        break;
    }

    emit(CalcState(output: output));
  }

  void calculate() {
    final currentState = state;
    try {
      String expression = currentState.output.replaceAll("x", "*");
      num result = expression.interpret();
      String resultStr =
          result.toStringAsFixed(3).replaceAll(RegExp(r'\.0+$'), '');

      if (resultStr.endsWith('.')) {
        resultStr = resultStr.substring(0, resultStr.length - 1);
      }

      emit(CalcState(output: resultStr));
    } catch (e) {
      emit(const CalcState(output: "Error"));
    }
  }
}
