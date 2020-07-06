import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/music_player_provider.dart';
import 'screens/home_screen.dart';

// TODO: Make _musicPlayerProvider not a singleton, and only runs on cartridge inserted
class MusicPlayerCartridge extends StatelessWidget {
  final MusicPlayerProvider _musicPlayerProvider = MusicPlayerProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MusicPlayerProvider>.value(
      value: _musicPlayerProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'AtlantisInternational',
          primarySwatch: Colors.green,
          primaryColor: Colors.red,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Color(0xFF08D507),
              fontSize: 30.0,
            ),
            bodyText2: TextStyle(
              color: Color(0xFF08D507),
              fontSize: 18.0,
            ),
            caption: TextStyle(
              color: Color(0xFF08D507),
              fontSize: 16.0,
            ),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
