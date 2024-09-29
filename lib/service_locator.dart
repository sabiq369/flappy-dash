import 'package:flappy_dash/audio_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setUpServiceLocator() async {
  getIt.registerLazySingleton<AudioHelper>(
    () => AudioHelper(),
  );
}
