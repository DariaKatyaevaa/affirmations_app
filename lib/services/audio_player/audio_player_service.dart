import 'package:just_audio/just_audio.dart';

class AudioPlayerService {
  late final audioPlayer = AudioPlayer();

  Future<void> playTrack(String url) async {
    final duration = await audioPlayer.setUrl(url);
    audioPlayer.play();
  }

  Future<void> stop() async {
    await audioPlayer.stop();
  }
}
