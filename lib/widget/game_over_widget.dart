import 'package:flappy_dash/bloc/game/game_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class GameOverWidget extends StatelessWidget {
  const GameOverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  fontSize: 38),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () => context.read<GameCubit>().restartGame(),
                child: Text(
                  'Play again',
                  style: GoogleFonts.chewy(color: Colors.black, fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }
}
