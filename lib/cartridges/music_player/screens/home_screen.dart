import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/music_player_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Selector<MusicPlayerProvider, int>(
          selector: (_, MusicPlayerProvider model) => model.count,
          builder: (_, int count, __) => Text(count.toString()),
        ),
      ),
    );
  }
}
