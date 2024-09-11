import 'package:flutter/material.dart';
import 'package:weather_app/widget/my_sizedbox.dart';

myRow({
  required String image,
  required String title,
  required String value,
}) {
  return Row(
    children: [
      Image.asset(
        image,
        scale: 8,
      ),
      mySizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          ),
          mySizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ],
      )
    ],
  );
}
