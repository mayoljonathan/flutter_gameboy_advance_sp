import 'package:flutter/material.dart';

import '../widgets/black_container.dart';
import '../widgets/player.dart';
import '../widgets/title_banner.dart';
import '../config/music_player_colors.dart';

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
