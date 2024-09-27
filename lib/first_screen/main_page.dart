import 'package:flame/game.dart';
import 'package:flappy_dash/flappy_dash_game/controller/flappy_dash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  FlappyDashController controller = Get.put(FlappyDashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: controller.flappyDashGame,
      ),
    );
  }
}
