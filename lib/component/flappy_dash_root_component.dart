import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/bloc/game/game_cubit.dart';
import 'package:flappy_dash/component/dash.dart';
import 'package:flappy_dash/component/dash_parallax_bg.dart';
import 'package:flappy_dash/component/pipe_pair.dart';
import 'package:flappy_dash/flappy_dash_game.dart';

class FlappyDashRootComponent extends Component
    with HasGameRef<FlappyDashGame>, FlameBlocReader<GameCubit, GameState> {
  late Dash _dash;
  late PipePair _lastPipe;
  static const _pipeDistance = 400.0;
  @override
  Future onLoad() async {
    await super.onLoad();
    add(DashBackground());
    add(_dash = Dash());
    _generatePipes(fromX: 350.0);
  }

  void _generatePipes({
    int count = 5,
    double fromX = 0.0,
  }) {
    for (int i = 0; i < count; i++) {
      const area = 700;
      final y = (Random().nextDouble() * area) - (area / 2);
      add(_lastPipe =
          PipePair(position: Vector2(fromX + (i * _pipeDistance), y)));
    }
  }

  void onSpaceDown() {
    checkToStart();
    _dash.jump();
  }

  void onTapDown(TapDownEvent event) {
    checkToStart();
    _dash.jump();
  }

  void _removeOldPipes() {
    final pipes = children.whereType<PipePair>();
    final shouldBeRemoved = max(pipes.length - 5, 0);
    pipes.take(shouldBeRemoved).forEach(
      (pipe) {
        pipe.removeFromParent();
      },
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_dash.x >= _lastPipe.x) {
      _generatePipes(fromX: _pipeDistance);
      _removeOldPipes();
    }
  }

  void checkToStart() {
    if (bloc.state.currentPlayingState == PlayingState.none) {
      bloc.startPlaying();
    }
  }
}
