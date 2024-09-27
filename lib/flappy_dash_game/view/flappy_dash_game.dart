import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_dash/component/dash.dart';

class FlappyDashGame extends FlameGame {
  FlappyDashGame()
      : super(
            world: FlappyDashWorld(),
            camera: CameraComponent.withFixedResolution(
              width: 600,
              height: 1000,
            ));
}

class FlappyDashWorld extends World {
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    add(DashBackground());
    add(Dash());
  }
}

class DashBackground extends ParallaxComponent<FlappyDashGame> {
  @override
  Future<void> onLoad() async {
    anchor = Anchor.center;
    parallax = await game.loadParallax(
      [
        ParallaxImageData('background/bg2.jpg'),
      ],
      baseVelocity: Vector2(1, 0),
      velocityMultiplierDelta: Vector2(100, 0),
    );
  }
}

class MyGame extends FlameGame {
  @override
  void onLoad() {
    add(DashBackground());
  }
}
