import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/image_composition.dart';

class HiddenCoin extends PositionComponent {
  HiddenCoin({
    required super.position,
  }) : super(
          size: Vector2(30, 30),
          anchor: Anchor.center,
        );

  @override
  void onLoad() {
    super.onLoad();

    add(CircleHitbox(
      collisionType: CollisionType.passive,
    ));
  }
}
