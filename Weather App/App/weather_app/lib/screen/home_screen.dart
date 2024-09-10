import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/data/icon.dart';
import 'package:weather_app/widget/my_center.dart';
import 'package:weather_app/widget/my_circle.dart';
import 'package:weather_app/widget/my_sizedbox.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: true,
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Stack(
          children: [
            myCircle(size: 218, color: Colors.deepPurple, left: 1.2, top: 0.09),
            myCircle(
                size: 218, color: Colors.deepPurple, left: -1.2, top: 0.09),
            Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  width: 600,
                  height: 400,
                  decoration: const BoxDecoration(color: Color(0xffffAB40)),
                )),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: BlocBuilder<WeatherBloc, WeatherState>(
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
                            Text("📍: ${state.weather.country}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                            // IconButton(
                            //     onPressed: () {
                            //       // Navigator.push(
                            //       //     context,
                            //       //     MaterialPageRoute(
                            //       //         builder: (context) => Search()));
                            //     },
                            //     icon: const Icon(Icons.search,
                            //         color: Colors.white, size: 32)),
                            Text("${state.weather.areaName}",
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
                                    "${state.weather.tempMax!.celsius?.round()} °C",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 48,
                                        fontWeight: FontWeight.w500))),
                            myCenter(
                                child: Text(
                                    "${state.weather.weatherMain?.toUpperCase()}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 38,
                                        fontWeight: FontWeight.w300))),
                            myCenter(
                                child: Text(
                                    DateFormat('EEEE dd •')
                                        .add_jm()
                                        .format(state.weather.date!),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w300))),
                            mySizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/11.png",
                                      scale: 8,
                                    ),
                                    mySizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Sunrise',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        mySizedBox(height: 5),
                                        Text(
                                          DateFormat()
                                              .add_jm()
                                              .format(state.weather.sunrise!),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/12.png",
                                      scale: 8,
                                    ),
                                    mySizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Sunset',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        mySizedBox(height: 5),
                                        Text(
                                          DateFormat()
                                              .add_jm()
                                              .format(state.weather.sunset!),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color.fromARGB(
                                                150, 255, 255, 255)))),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/13.png",
                                      scale: 8,
                                    ),
                                    mySizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Temp Max',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        mySizedBox(height: 5),
                                        Text(
                                          "${state.weather.tempMax!.celsius!.round()} °C",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/14.png",
                                      scale: 8,
                                    ),
                                    mySizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Temp Min',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        mySizedBox(height: 5),
                                        Text(
                                          "${state.weather.tempMin!.celsius!.round()} °C",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
