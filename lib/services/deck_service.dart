import 'package:rich/models/deck_model.dart';
import 'package:rich/models/draw_model.dart';
import 'package:rich/services/api_service.dart';

class DeckServices extends ApiServices {
  Future<dynamic> newDeck([int deckcount = 1]) async {
    final data = await httpGet(
      '/deck/new/shuffle',
      params: {'deck_count': deckcount},
    );

    return DeckModel.fromJson(data);
  }

  Future<dynamic> drawcards(DeckModel deck, {int count = 1}) async {
    final data = await httpGet(
      '/deck/${deck.deck_id}/draw',
      params: {'count': count},
    );
    return DrawModel.fromJson(data);
  }
}
