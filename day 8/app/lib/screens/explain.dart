import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/counter_cubit.dart';
import 'package:flutter_application_1/cubit/counter_state.dart';
import 'package:flutter_application_1/widget/my_elevatedbutton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Explain extends StatelessWidget {
  int teamApoints = 0;
  int teamBpoints = 0;

  Explain({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text('Points Counter'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Team A',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          '${BlocProvider.of<CounterCubit>(context).temAPoints}',
                          style: const TextStyle(
                            fontSize: 150,
                          ),
                        ),
                        const MyElevatedButton(
                          teamName: "A",
                          teamPoints: 1,
                        ),
                        const MyElevatedButton(
                          teamName: "A",
                          teamPoints: 2,
                        ),
                        const MyElevatedButton(
                          teamName: "A",
                          teamPoints: 3,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 500,
                    child: VerticalDivider(
                      indent: 50,
                      endIndent: 50,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Team B',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          '${BlocProvider.of<CounterCubit>(context).temBPoints}',
                          style: const TextStyle(
                            fontSize: 150,
                          ),
                        ),
                        const MyElevatedButton(teamName: "B", teamPoints: 1),
                        const MyElevatedButton(teamName: "B", teamPoints: 2),
                        const MyElevatedButton(teamName: "B", teamPoints: 3),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  backgroundColor: Colors.orange,
                  minimumSize: const Size(150, 50),
                ),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).reset();
                },
                child: const Text(
                  'Reset',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (State is CounterAIncrement) {
          teamApoints = BlocProvider.of<CounterCubit>(context).temAPoints;
        } else {
          teamBpoints = BlocProvider.of<CounterCubit>(context).temBPoints;
        }
      },
    );
  }
}
