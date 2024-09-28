import 'package:flame/game.dart';
import 'package:flappy_dash/flappy_dash_game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  FlappyDashGame flappyDashGame = FlappyDashGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: flappyDashGame,
      ),
    );
  }
}
