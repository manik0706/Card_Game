import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rich/components/playing_card.dart';
import 'package:rich/constants.dart';
import 'package:rich/models/card_model.dart';

class DiscardPile extends StatelessWidget {
  final List<CardModel> cards;
  final double size;
  final Function(CardModel)? onPressed;

  const DiscardPile({
    Key? key,
    required this.cards,
    this.size = 1,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!(cards.last);
        }
      },
      child: Container(
        width: CARD_WIDTH * size,
        height: CARD_HEIGHT * size,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black38, width: 2)),
        child: Stack(
          children: cards
              .map((card) => PlayingCard(
                    card: card,
                    visible: true,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
