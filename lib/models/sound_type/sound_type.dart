import 'package:affirmations_app/constants/endpoints.dart';

enum SoundType {
  rain('rain', AppEndpoints.rainSoundUrl),
  forest('forest', AppEndpoints.forestSoundUrl),
  night('nightSounds', AppEndpoints.nightSoundUrl),
  relax('relax', AppEndpoints.relaxSoundUrl);

  const SoundType(this.text, this.url);

  final String text;
  final String url;
}
