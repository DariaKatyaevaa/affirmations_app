import 'package:affirmations_app/models/sound_type/sound_type.dart';
import 'package:affirmations_app/providers/services_providers.dart';
import 'package:affirmations_app/providers/settings_providers.dart';
import 'package:affirmations_app/services/audio_player/audio_player_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final audioPlayerProvider = StateNotifierProvider<AudioPlayerNotifier, AsyncValue<bool>>((ref) {
  final audioPlayerService = ref.watch(audioPlayerServiceProvider);
  final soundType = ref.watch(soundTypeProvider);

  return AudioPlayerNotifier(audioPlayerService, soundType);
});

class AudioPlayerNotifier extends StateNotifier<AsyncValue<bool>> {
  final AudioPlayerService audioPlayerService;
  final SoundType soundType;

  bool? get isPlaying => state.value;

  AudioPlayerNotifier(this.audioPlayerService, this.soundType) : super(AsyncValue.data(false));

  void play() async {
    state = const AsyncLoading();
    await audioPlayerService.playTrack(soundType.url);
    state = const AsyncValue.data(true);
  }

  void stop() async {
    state = const AsyncLoading();
    await audioPlayerService.stop();
    state = const AsyncValue.data(false);
  }
}
