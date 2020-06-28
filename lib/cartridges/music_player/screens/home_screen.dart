import 'package:flutter/material.dart';
import 'package:flutter_gameboy_advance_sp/cartridges/music_player/config/music_player_colors.dart';

import '../../widgets/title_banner.dart';
import '../../widgets/black_container.dart';
import '../../widgets/player.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: MusicPlayerColors.background,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlackContainer(
              child: TitleBanner(),
            ),
            Expanded(
              child: Player(),
            ),
          ],
        ),
      ),
    );
  }
}
