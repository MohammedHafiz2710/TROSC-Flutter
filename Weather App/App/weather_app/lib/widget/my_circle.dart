import 'package:flutter/material.dart';

myCircle({double? size, Color? color, double? left, double? top}) {
  return Align(
      alignment: AlignmentDirectional(left!, top!),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ));
}
