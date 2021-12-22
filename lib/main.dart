import 'package:audio_key/floor/dao/audio_key_dao.dart';
import 'package:audio_key/floor/database/database.dart';
import 'package:audio_key/home_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorAppDatabase.databaseBuilder('key-v.0.1.db').build();

  runApp(ProviderScope(child: MyApp(audioKeyDAO: database.buttonDao,)));
}

class MyApp extends StatelessWidget {
  final AudioKeyDAO audioKeyDAO;

  const MyApp({Key? key,
    required this.audioKeyDAO
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Audio Key',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(audioKeyDAO: audioKeyDAO,),
    );
  }
}

