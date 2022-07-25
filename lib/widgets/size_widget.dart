import 'package:example_project/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SizedHeight extends StatelessWidget {
  SizedHeight(this.height);
  double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class SizedWidth extends StatelessWidget {
  SizedWidth(this.width);
  double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width,
    );
  }
}
