import 'package:floor/floor.dart';

@entity
class AudioKey {
  @PrimaryKey(autoGenerate: true)
  final int? buttonId;

  final String name, filePath;
  int color;

  AudioKey({this.buttonId,
     required this.name,
     required this.filePath,
     required this.color,
  });

}
// IF CHANGE:
// first: Delete file 'database/database.g.dart'
// then: TERMINAL> flutter packages pub run build_runner build