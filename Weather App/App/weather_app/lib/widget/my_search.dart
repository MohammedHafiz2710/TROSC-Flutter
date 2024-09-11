import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';

class MySearch extends StatelessWidget {
  final TextEditingController? controller;
  final double padding;

  const MySearch({super.key, this.controller, required this.padding});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  controller: controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none)),
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      context.read<WeatherBloc>().add(SearchWeather(value));
                    }
                  },
                ),
                if (state is WeatherFailure) ...[
                  const SizedBox(height: 20),
                  Text(
                    state.errorMessage,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
