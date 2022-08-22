import 'package:flutter/cupertino.dart';
import 'package:rich/components/playing_card.dart';
import 'package:rich/constants.dart';
import 'package:rich/models/card_model.dart';
import 'package:rich/models/player_model.dart';

class CardList extends StatelessWidget {
  final double size;
  final PlayerModel player;
  final Function(CardModel)? onPlayCard;

  const CardList({
    Key? key,
    required this.player,
    this.size = 1,
    this.onPlayCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CARD_HEIGHT * size,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: player.cards.length,
        itemBuilder: (context, index) {
          final card = player.cards[index];
          return PlayingCard(
            card: card,
            size: size,
            visible: true,
            onPlayCard: onPlayCard,
          );
        },
      ),
    );
  }
}
