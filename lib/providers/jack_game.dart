import 'package:rich/components/game_board.dart';
import 'package:rich/constants.dart';
import 'package:rich/models/card_model.dart';
import 'package:rich/providers/game_provider.dart';

class JackGame extends GameProvider {
  @override
  Future<void> setupBoard() async {
    for (var p in players) {
      await drawCards(p, count: 4, allowAnyTime: true);
    }
    drawCardToDiscardPile();
    setLastPlayed(discardTop!);
  }

  @override
  bool get canEndTurn {
    if (turn.drawCount > 0 || turn.actionCount > 0) {
      return true;
    }
    return false;
  }

  @override
  bool canPlayCard(CardModel card) {
    bool canPlay = false;
    if (gameState[GS_LAST_SUIT] == null || gameState[GS_LAST_VALUE] == null) {
      return false;
    }

    if (gameState[GS_LAST_SUIT] == card.suit) {
      canPlay = true;
    }

    if (gameState[GS_LAST_VALUE] == card.value) {
      canPlay = true;
    }

    if (card.value == "8") {
      canPlay = true;
    }

    return canPlay;
  }
}
