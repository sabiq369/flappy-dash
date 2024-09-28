import 'package:flame/components.dart';
import 'package:flappy_dash/component/hidden_coin.dart';
import 'package:flappy_dash/component/pipe.dart';

class PipePair extends PositionComponent {
  PipePair({required super.position, this.gap = 130.0, this.speed = 120.0});
  final double gap, speed;

  @override
  void onLoad() {
    super.onLoad();

    addAll(
      [
        Pipe(isFlipped: false, position: Vector2(0, gap / 2)),
        Pipe(isFlipped: true, position: Vector2(0, -(gap / 2))),
        HiddenCoin(position: Vector2(30, 0)),
      ],
    );
  }

  @override
  void update(double dt) {
    position.x -= speed * dt;
    super.update(dt);
  }
}
