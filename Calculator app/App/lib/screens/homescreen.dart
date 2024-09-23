import 'package:calc/cubit/calculator_state.dart';
import 'package:calc/widget/my_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calc/cubit/calculator_cubit.dart';
import 'package:calc/widget/my_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: BlocConsumer<CalculatorCubit, CalcState>(
            listener: (context, state) {
              if (state.output == "Error") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Invalid expression"),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      state.output,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyButton(
                          color: const Color(0xff93A3F3),
                          text: 'C',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('C')),
                      MyButton(
                          color: const Color(0xff93A3F3),
                          text: '( )',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('()')),
                      MyButton(
                          color: const Color(0xff93A3F3),
                          text: '/',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('/')),
                      MyButton(
                          color: const Color(0xff93A3F3),
                          text: 'del',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('del')),
                    ],
                  ),
                  mySizedBoxd(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyButton(
                          color: const Color(0xff333333),
                          text: '7',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('7')),
                      MyButton(
                          color: const Color(0xff333333),
                          text: '8',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('8')),
                      MyButton(
                          color: const Color(0xff333333),
                          text: '9',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('9')),
                      MyButton(
                          color: const Color(0xff93A3F3),
                          text: 'x',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('x')),
                    ],
                  ),
                  mySizedBoxd(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyButton(
                          color: const Color(0xff333333),
                          text: '4',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('4')),
                      MyButton(
                          color: const Color(0xff333333),
                          text: '5',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('5')),
                      MyButton(
                          color: const Color(0xff333333),
                          text: '6',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('6')),
                      MyButton(
                          color: const Color(0xff93A3F3),
                          text: '-',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('-')),
                    ],
                  ),
                  mySizedBoxd(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyButton(
                          color: const Color(0xff333333),
                          text: '1',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('1')),
                      MyButton(
                          color: const Color(0xff333333),
                          text: '2',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('2')),
                      MyButton(
                          color: const Color(0xff333333),
                          text: '3',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('3')),
                      MyButton(
                          color: const Color(0xff93A3F3),
                          text: '+',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('+')),
                    ],
                  ),
                  mySizedBoxd(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyButton(
                          color: const Color(0xff333333),
                          text: '0',
                          width: 175,
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('0')),
                      MyButton(
                          color: const Color(0xff333333),
                          text: '•',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('.')),
                      MyButton(
                          color: const Color(0xff93A3F3),
                          text: '=',
                          onPressed: () =>
                              context.read<CalculatorCubit>().setOutput('=')),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
