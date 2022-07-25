import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlayWidget extends StatelessWidget {
  const PlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 17,
      child: Center(
          child: Icon(
        CupertinoIcons.play_arrow_solid,
        color: Colors.red,
        size: 20,
      )),
    );   
  }
}