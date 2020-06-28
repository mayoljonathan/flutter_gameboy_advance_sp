import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'cartridges/music_player/music_player.dart';
import 'cartridges/music_player/providers/music_player_input_provider_impl.dart';
import 'cartridges/music_player/providers/music_player_provider.dart';
import 'providers/system_input_provider_impl.dart';
import 'screens/main_screen.dart';
import 'system.dart';

System _system = System();
MusicPlayerInputProviderImpl _musicPlayerInputProviderImpl = MusicPlayerInputProviderImpl();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(MyApp());

  _system.loadCartridge(MusicPlayer());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<System>.value(value: _system),
        Provider<SystemInputProviderImpl>(
          create: (_) => SystemInputProviderImpl(_musicPlayerInputProviderImpl),
        ),
        ChangeNotifierProvider<MusicPlayerProvider>(
          create: (_) => MusicPlayerProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Gameboy Advance SP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        builder: (_, child) {
          return ResponsiveWrapper.builder(
            child,
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
          );
        },
        home: MainScreen(),
      ),
    );
  }
}
