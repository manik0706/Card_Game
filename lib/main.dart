import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rich/providers/game_provider.dart';
import 'package:rich/providers/jack_game.dart';
import 'package:rich/screens/game_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => JackGame())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GameScreen(),
    );
  }
}
