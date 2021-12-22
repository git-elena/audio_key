import 'dart:async';

import 'package:audio_key/floor/dao/audio_key_dao.dart';
import 'package:audio_key/floor/entity/db_audio_key.dart';
import 'package:floor/floor.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version:1, entities: [AudioKey])
abstract class AppDatabase extends FloorDatabase {
  AudioKeyDAO get buttonDao;
}

// IF CHANGE:
// first: Delete file 'database/database.g.dart'
// then: TERMINAL> flutter packages pub run build_runner build