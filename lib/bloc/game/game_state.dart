part of 'game_cubit.dart';

class GameState with EquatableMixin {
  GameState(
      {this.currentScore = 0, this.currentPlayingState = PlayingState.none});
  final int currentScore;
  late final PlayingState currentPlayingState;

  GameState copyWith({
    int? currentScore,
    PlayingState? currentPlayingState,
  }) =>
      GameState(
        currentScore: currentScore ?? this.currentScore,
        currentPlayingState: currentPlayingState ?? this.currentPlayingState,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        currentScore,
        currentPlayingState,
      ];
}

enum PlayingState {
  none,
  playing,
  paused,
  gameOver,
}
