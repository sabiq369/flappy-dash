import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class Dash extends PositionComponent {
  Dash()
      : super(
            position: Vector2(0, 0),
            size: Vector2.all(80),
            anchor: Anchor.center);
  late Sprite _flappySprite;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _flappySprite = await Sprite.load("flappy.png");
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += Vector2(0, 0);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _flappySprite.render(canvas, size: size);
  }
}
