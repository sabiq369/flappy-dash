import 'dart:ui';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/bloc/game/game_cubit.dart';
import 'package:flappy_dash/component/hidden_coin.dart';
import 'package:flappy_dash/component/pipe.dart';
import 'package:flappy_dash/flappy_dash_game.dart';
import 'package:flutter/material.dart';

class Dash extends PositionComponent
    with
        CollisionCallbacks,
        HasGameRef<FlappyDashGame>,
        FlameBlocReader<GameCubit, GameState> {
  Dash()
      : super(
            position: Vector2(0, 0),
            size: Vector2.all(75),
            anchor: Anchor.center,
            priority: 10);
  late Sprite _dashSprite;
  final Vector2 _gravity = Vector2(0, 1200), _jumpForce = Vector2(0, -350);
  Vector2 _velocity = Vector2(0, 10);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _dashSprite = await Sprite.load("dash_2.png");
    final radius = size.x / 2;
    final center = size / 2;

    add(CircleHitbox(
      radius: radius * 0.75,
      position: center * 1.1,
      anchor: Anchor.center,
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (bloc.state.currentPlayingState != PlayingState.playing) {
      return;
    }
    if (position.y - size.y / 2 > gameRef.size.y) {
      bloc.gameOver();
      return;
    }

    _velocity += _gravity * dt;
    position += _velocity * dt;
  }

  void jump() {
    if (bloc.state.currentPlayingState != PlayingState.playing) {
      return;
    }
    _velocity = _jumpForce;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _dashSprite.render(canvas, size: size);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (bloc.state.currentPlayingState != PlayingState.playing) {
      return;
    }
    if (other is HiddenCoin) {
      bloc.increaseScore();
      other.removeFromParent();
    } else if (other is Pipe) {
      bloc.gameOver();
    }
  }
}
