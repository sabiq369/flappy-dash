import 'dart:ui';

import 'package:flappy_dash/bloc/game/game_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class GameOverWidget extends StatelessWidget {
  const GameOverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            color: Colors.black54,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'GAME OVER!',
                    style: GoogleFonts.chewy(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                        fontSize: 38),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'SCORE: ${state.currentScore}',
                      style: GoogleFonts.chewy(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                          fontSize: 25),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => context.read<GameCubit>().restartGame(),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: Text(
                      'PLAY AGAIN!',
                      style: GoogleFonts.chewy(
                          color: Colors.black, fontSize: 15, letterSpacing: 2),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
