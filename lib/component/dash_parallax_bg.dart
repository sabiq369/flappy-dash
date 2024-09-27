import 'package:flame/components.dart';
import 'package:flame/parallax.dart';

import '../flappy_dash_game/view/flappy_dash_game.dart';

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
