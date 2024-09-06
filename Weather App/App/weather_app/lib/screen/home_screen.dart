import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/widget/my_center.dart';
import 'package:weather_app/widget/my_circle.dart';
import 'package:weather_app/widget/my_row.dart';
import 'package:weather_app/widget/my_sizedbox.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: true,
      child: Container(
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
              child: Container(
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("📍: EG",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400)),
                      mySizedBox(height: 10),
                      const Text("Port Said",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w700)),
                      myCenter(
                        child: Image.asset("assets/6.png", width: 600),
                      ),
                      myCenter(
                          child: const Text("28 °C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 48,
                                  fontWeight: FontWeight.w500))),
                      myCenter(
                          child: const Text("CLEAR",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 38,
                                  fontWeight: FontWeight.w300))),
                      myCenter(
                          child: const Text("Thursday 08 , 8:44PM",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300))),
                      mySizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          myRow(
                              image: "assets/11.png",
                              title: "Sunrise",
                              time: "5:30 AM"),
                          myRow(
                              image: "assets/12.png",
                              title: "Sunset",
                              time: "5:30 AM"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color:
                                          Color.fromARGB(150, 255, 255, 255)))),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          myRow_temp(
                              image: "assets/13.png",
                              title: "Temp Max",
                              temp: "28 °C"),
                          myRow_temp(
                              image: "assets/14.png",
                              title: "Temp min",
                              temp: "28 °C"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
