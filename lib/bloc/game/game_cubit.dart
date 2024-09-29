import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flappy_dash/audio_helper.dart';
import 'package:meta/meta.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit(this._audioHelper) : super(GameState());

  final AudioHelper _audioHelper;

  void startPlaying() {
    _audioHelper.playBackgroundAudio();
    emit(
      state.copyWith(
          currentPlayingState: PlayingState.playing, currentScore: 0),
    );
  }

  void increaseScore() {
    _audioHelper.playScoreSound();
    emit(
      state.copyWith(currentScore: state.currentScore + 1),
    );
  }

  void gameOver() {
    _audioHelper.stopBackgroundAudio();
    emit(
      state.copyWith(currentPlayingState: PlayingState.gameOver),
    );
  }

  restartGame() {
    emit(state.copyWith(
      currentPlayingState: PlayingState.none,
      currentScore: 0,
    ));
  }
}
