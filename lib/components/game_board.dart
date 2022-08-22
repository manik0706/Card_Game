import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rich/components/card_list.dart';
import 'package:rich/components/deck_pile.dart';
import 'package:rich/components/discard_file.dart';
import 'package:rich/components/playing_card.dart';
import 'package:rich/models/card_model.dart';
import 'package:rich/models/player_model.dart';
import 'package:rich/providers/game_provider.dart';
import 'package:rich/providers/jack_game.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<JackGame>(builder: (context, model, child) {
      return model.currentDeck != null
          ? Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await model.drawCards(model.turn.currentPlayer);
                        },
                        child: DeckPile(
                          remaining: model.currentDeck!.remaining,
                        ),
                      ),
                      const SizedBox(width: 8),
                      DiscardPile(cards: model.discards),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: CardList(
                    player: model.players[1],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //if (model.turn.currentPlayer == model.players[0])
                            ElevatedButton(
                              onPressed: model.canEndTurn
                                  ? () {
                                      model.endTurn();
                                    }
                                  : null,
                              child: const Text("pass turn"),
                            ),
                          ],
                        ),
                      ),
                      CardList(
                        player: model.players[0],
                        onPlayCard: (CardModel card) {
                          model.playCard(player: model.players[0], card: card);
                        },
                      ),
                    ],
                  ),
                )
              ],
            )
          : Center(
              child: TextButton(
                child: Text("new game?"),
                onPressed: () {
                  final players = [
                    PlayerModel(name: "manik", isHuman: true),
                    PlayerModel(name: "bot", isHuman: false),
                  ];
                  model.newGame(players);
                },
              ),
            );
    });
  }
}
