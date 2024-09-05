import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyElevatedButton extends StatelessWidget {
  final String teamName;
  final int teamPoints;

  const MyElevatedButton({
    super.key,
    required this.teamName,
    required this.teamPoints,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        minimumSize: const Size(150, 50),
      ),
      onPressed: () {
        BlocProvider.of<CounterCubit>(context)
            .teamAIncrement(team: teamName, buttonNum: teamPoints);
      },
      child: Text(
        'Add $teamPoints Point ',
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
