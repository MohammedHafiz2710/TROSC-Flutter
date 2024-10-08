import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/data/icon.dart';
import 'package:weather_app/widget/my_center.dart';
import 'package:weather_app/widget/my_circle.dart';
import 'package:weather_app/widget/my_row.dart';
import 'package:weather_app/widget/my_search.dart';
import 'package:weather_app/widget/my_sizedbox.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Stack(
            children: [
              myCircle(
                  size: 218, color: Colors.deepPurple, left: 1.2, top: 0.09),
              myCircle(
                  size: 218, color: Colors.deepPurple, left: -1.2, top: 0.09),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  width: 600,
                  height: 400,
                  decoration: const BoxDecoration(color: Color(0xffffAB40)),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: BlocConsumer<WeatherBloc, WeatherState>(
                  listener: (context, state) {
                    if (state is WeatherSuccess || state is WeatherFailure) {
                      _searchController.clear();
                    }
                  },
                  builder: (context, state) {
                    if (state is WeatherSuccess) {
                      return Container(
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MySearch(
                                  padding: 0, controller: _searchController),
                              Text(
                                  "📍${state.weather.country}" +
                                      ' :' +
                                      "${state.weather.areaName}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w700)),
                              myCenter(
                                child: GetIcon(
                                    code: state.weather.weatherConditionCode!),
                              ),
                              myCenter(
                                child: Text(
                                    "${state.weather.tempMax!.celsius!.round()} °C",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 48,
                                        fontWeight: FontWeight.w500)),
                              ),
                              myCenter(
                                child: Text(
                                    "${state.weather.weatherMain?.toUpperCase()}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 38,
                                        fontWeight: FontWeight.w300)),
                              ),
                              myCenter(
                                child: Text(
                                    DateFormat('EEEE dd •')
                                        .add_jm()
                                        .format(state.weather.date!),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w300)),
                              ),
                              mySizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  myRow(
                                      image: "assets/11.png",
                                      title: "Sunrise",
                                      value:
                                          "${DateFormat().add_jm().format(state.weather.sunrise!)}"),
                                  myRow(
                                      image: "assets/12.png",
                                      title: "Sunset",
                                      value:
                                          "${DateFormat().add_jm().format(state.weather.sunset!)}"),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color.fromARGB(
                                                  150, 255, 255, 255)))),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  myRow(
                                      image: "assets/13.png",
                                      title: "Max Temp",
                                      value:
                                          "${state.weather.tempMax!.celsius!.round()} °C"),
                                  myRow(
                                      image: "assets/14.png",
                                      title: "Min Temp",
                                      value:
                                          "${state.weather.tempMin!.celsius!.round()} °C"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (state is WeatherLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is WeatherFailure) {
                      return MySearch(
                          controller: _searchController, padding: 24);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
