import 'package:hive/hive.dart';

part 'text_type.g.dart';

@HiveType(typeId: 3)
enum TextType {
  @HiveField(0)
  affirmation('affirmationsType'),
  @HiveField(1)
  quote('quotesType');

  const TextType(this.text);

  final String text;
}
