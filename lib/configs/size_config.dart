import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? width;
  static double? height;
  static double? defaultSize;
  static Orientation? orientation;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    width = _mediaQueryData!.size.width;
    height = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
    defaultSize = orientation == Orientation.landscape
        ? height! * 0.024
        : width! * 0.024;
  }
}

double getFont(double size) {
  double defaultsSize = SizeConfig.defaultSize! * size;
  return (defaultsSize / 10);
}

double getHeight(double inputHeight) {
  double height = SizeConfig.height!;
  return (inputHeight / 840.0) * height;
}

double getWidth(double inputWidth) {
  double width = SizeConfig.width!;
  return (inputWidth / 375.0) * width;
}