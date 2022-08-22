import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rich/constants.dart';

class CardBack extends StatelessWidget {
  final double size;
  final Widget? child;

  const CardBack({Key? key, this.size = 1, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CARD_WIDTH * size,
      height: CARD_HEIGHT * size,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: child ?? Container(),
    );
  }
}
