import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class Dash extends PositionComponent {
  Dash()
      : super(
            position: Vector2(0, 0),
            size: Vector2.all(50),
            anchor: Anchor.center);
  late Sprite _flappySprite;
  final Vector2 _gravity = Vector2(0, 900), _jumpForce = Vector2(0, -350);
  Vector2 _velocity = Vector2(0, 10);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _flappySprite = await Sprite.load("flappy.png");
  }

  @override
  void update(double dt) {
    super.update(dt);
    _velocity += _gravity * dt;
    position += _velocity * dt;
  }

  void jump() {
    _velocity = _jumpForce;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _flappySprite.render(canvas, size: size);
  }
}
