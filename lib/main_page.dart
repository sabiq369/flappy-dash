import 'package:flame/game.dart';
import 'package:flappy_dash/bloc/game/game_cubit.dart';
import 'package:flappy_dash/flappy_dash_game.dart';
import 'package:flappy_dash/widget/game_over_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late FlappyDashGame flappyDashGame;
  late GameCubit gameCubit;
  PlayingState? _latestState;

  @override
  void initState() {
    super.initState();
    gameCubit = BlocProvider.of<GameCubit>(context);
    flappyDashGame = FlappyDashGame(gameCubit);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameState>(
      listener: (context, state) {
        if (state.currentPlayingState == PlayingState.none &&
            _latestState == PlayingState.gameOver) {
          setState(() {
            flappyDashGame = FlappyDashGame(gameCubit);
          });
        }
        _latestState = state.currentPlayingState;
      },
      builder: (BuildContext context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                GameWidget(
                  game: flappyDashGame,
                ),
                if (state.currentPlayingState == PlayingState.gameOver)
                  const GameOverWidget(),
                if (state.currentPlayingState == PlayingState.none)
                  Align(
                    child: IgnorePointer(
                      child: Container(
                        color: Colors.black54,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'TAP TO PLAY',
                            style: GoogleFonts.chewy(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          ),
                        ),
                      )
                          .animate(
                            onPlay: (controller) =>
                                controller.repeat(reverse: true),
                          )
                          .scale(
                              begin: Offset(1.0, 1.0), end: Offset(1.2, 1.2)),
                    ),
                    alignment: Alignment(0, 0.2),
                  ),
                if (state.currentPlayingState != PlayingState.gameOver)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Text(
                        state.currentScore.toString(),
                        style:
                            GoogleFonts.chewy(fontSize: 25, color: Colors.red),
                      ),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
