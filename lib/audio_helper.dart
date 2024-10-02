import 'package:flutter_soloud/flutter_soloud.dart';

class AudioHelper {
  late SoLoud _soLoud;
  late AudioSource _backgroundSource, _scoreSource;
  SoundHandle? _playingBackground;

  Future<void> initialize() async {
    _soLoud = SoLoud.instance;
    if (_soLoud.isInitialized) {
      return;
    }
    await _soLoud.init();
    _backgroundSource = await _soLoud.loadAsset("assets/audios/bg_music.mp3");
    _scoreSource = await _soLoud.loadAsset("assets/audios/score_music.mp3");
  }

  void playBackgroundAudio() async {
    _playingBackground = await _soLoud.play(
      _backgroundSource,
      looping: true,
    );
  }

  void stopBackgroundAudio() {
    if (_playingBackground == null) {
      return;
    }
    _soLoud.fadeVolume(
        _playingBackground!, 0.0, const Duration(milliseconds: 500));
  }

  void playScoreSound() async {
    await _soLoud.play(_scoreSource);
  }
}
