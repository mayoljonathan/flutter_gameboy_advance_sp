import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'cartridges/music_player/music_player_cartridge.dart';
import 'cartridges/music_player/providers/music_player_input_provider_impl.dart';
import 'cartridges/number_counter/number_counter_cartridge.dart';
import 'cartridges/number_counter/providers/number_counter_input_provider_impl.dart';
import 'models/cartridge.dart';
import 'providers/system_input_provider_impl.dart';
import 'screens/main_screen.dart';
import 'system.dart';

System _system = System();
List<CartRidge> _cartRidges = [
  CartRidge(
    name: 'Music Player',
    widget: MusicPlayerCartridge(),
    inputProvider: MusicPlayerInputProviderImpl(),
  ),
  CartRidge(
    name: 'Flutter Counter',
    widget: NumberCounterCartridge(),
    inputProvider: NumberCounterInputProviderImpl(),
  ),
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await SystemChrome.setEnabledSystemUIOverlays([]);
  }

  _system.selectCartridge(_cartRidges.first);

  runApp(Gameboy());
}

class Gameboy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<List<CartRidge>>.value(value: _cartRidges),
        ChangeNotifierProvider<System>.value(value: _system),
        ProxyProvider<System, SystemInputProviderImpl>(
          update: (_, System system, __) => SystemInputProviderImpl(_system.selectedCartridge.inputProvider),
        )
      ],
      child: MaterialApp(
        title: 'Gameboy Advance SP',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        builder: (_, child) {
          return ResponsiveWrapper.builder(
            child,
            maxWidth: 480,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
            ],
          );
        },
        home: MainScreen(),
      ),
    );
  }
}
