import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_dash/component/dash.dart';
import 'package:flappy_dash/component/dash_parallax_bg.dart';

class FlappyDashGame extends FlameGame {
  FlappyDashGame()
      : super(
            world: FlappyDashWorld(),
            camera: CameraComponent.withFixedResolution(
              width: 600,
              height: 1000,
            ));
}

class FlappyDashWorld extends World with TapCallbacks {
  late Dash _dash;
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    add(DashBackground());
    add(_dash = Dash());
  }

  @override
  void onTapDown(TapDownEvent event) {
    // TODO: implement onTapDown
    super.onTapDown(event);
    _dash.jump();
  }
}
