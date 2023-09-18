import 'package:affirmations_app/constants/endpoints.dart';
import 'package:hive/hive.dart';

part 'sound_type.g.dart';

@HiveType(typeId: 2, adapterName: 'SoundTypeAdapter')
enum SoundType {
  @HiveField(0)
  rain('rain', AppEndpoints.rainSoundUrl),
  @HiveField(1)
  forest('forest', AppEndpoints.forestSoundUrl),
  @HiveField(2)
  night('nightSounds', AppEndpoints.nightSoundUrl),
  @HiveField(3)
  relax('relax', AppEndpoints.relaxSoundUrl);

  const SoundType(this.text, this.url);

  final String text;
  final String url;
}
