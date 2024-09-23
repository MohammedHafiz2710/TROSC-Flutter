import 'package:equatable/equatable.dart';

class CalcState extends Equatable {
  final String output;

  const CalcState({required this.output});

  @override
  List<Object?> get props => [output];
}

class CalcInitial extends CalcState {
  const CalcInitial(String output) : super(output: output);
}
