import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rich/components/game_board.dart';
import 'package:rich/models/player_model.dart';
import 'package:rich/providers/game_provider.dart';
import 'package:rich/providers/jack_game.dart';
import 'package:rich/services/deck_service.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final JackGame _gameProvider;
  @override
  void initState() {
    _gameProvider = Provider.of<JackGame>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('card game'),
        actions: [
          TextButton(
              onPressed: () async {
                final players = [
                  PlayerModel(name: "manik", isHuman: true),
                  PlayerModel(name: "bot", isHuman: false),
                ];

                await _gameProvider.newGame(players);
              },
              child: const Text(
                "new game",
                style: TextStyle(
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: const GameBoard(),
    );
  }
}
