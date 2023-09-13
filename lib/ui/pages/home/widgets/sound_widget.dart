import 'package:affirmations_app/providers/audio_player_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SoundWidget extends StatelessWidget {
  const SoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final isPlaying = ref.watch(audioPlayerProvider).maybeWhen(
            orElse: () => false,
            data: (_) => _,
          );
      final player = ref.read(audioPlayerProvider.notifier);
      return GestureDetector(
        onTap: () => isPlaying ? player.stop() : player.play(),
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Icon(
            Icons.volume_up_rounded,
            color: isPlaying ? Colors.white : Colors.black38,
            size: 28.0,
          ),
        ),
      );
    });
  }
}
