import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

class MusicPlayerCartridge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'AtlantisInternational',
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          body1: TextStyle(
            color: Color(0xFF08D507),
            fontSize: 24.0,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
