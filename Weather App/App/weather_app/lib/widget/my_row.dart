import 'package:flutter/material.dart';
import 'package:weather_app/widget/my_sizedbox.dart';

myRow({
  String? image,
  String? title,
  String? time,
}) {
  return Row(
    children: [
      Image.asset(
        "$image",
        scale: 8,
      ),
      mySizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300),
          ),
          mySizedBox(height: 5),
          Text(
            '$time',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ],
      )
    ],
  );
}

myRow_temp({
  String? image,
  String? title,
  String? temp,
}) {
  return Row(
    children: [
      Image.asset(
        "$image",
        scale: 8,
      ),
      mySizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300),
          ),
          mySizedBox(height: 5),
          Text(
            '$temp',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ],
      )
    ],
  );
}
