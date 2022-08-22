import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rich/components/card_back.dart';

class DeckPile extends StatelessWidget {
  final int remaining;
  final double size;
  final bool canDraw;

  const DeckPile({
    Key? key,
    required this.remaining,
    this.size = 1,
    this.canDraw = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardBack(
      size: size,
      child: Center(
          child: Text(
        "$remaining",
        style: const TextStyle(color: Colors.white),
      )),
    );
  }
}
