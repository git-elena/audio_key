
import 'package:audio_key/floor/entity/db_audio_key.dart';
import 'package:floor/floor.dart';

@dao
abstract class AudioKeyDAO {
  @Query('SELECT * FROM AudioKey')
  Future<List<AudioKey>> getAllItemInButton();

  @Query('SELECT * FROM AudioKey WHERE buttonId=:id')
  Future<AudioKey?> getItemInButtonById(int id);

  @Query('DELETE FROM AudioKey WHERE buttonId=:id')
  Future<AudioKey?> deleteButtonById(int id);

  @insert
  Future<int> insertButtonBV(AudioKey button);

  @update
  Future<int> updateButtonBV(AudioKey button);


}