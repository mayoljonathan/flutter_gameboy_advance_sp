import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../config/music_player_colors.dart';
import '../providers/music_player_provider.dart';
import 'black_container.dart';

class MyPlaylist extends StatefulWidget {
  @override
  _MyPlaylistState createState() => _MyPlaylistState();
}

class _MyPlaylistState extends State<MyPlaylist> {
  final ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) {
    final musicPlayer = context.watch<MusicPlayerProvider>();

    return BlackContainer(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: ScrollablePositionedList.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: musicPlayer.playlist.length,
        itemScrollController: musicPlayer.itemScrollController,
        itemPositionsListener: _itemPositionsListener,
        itemBuilder: (_, int i) {
          final audioItem = musicPlayer.playlist[i];

          return Selector<MusicPlayerProvider, Audio>(
            selector: (_, MusicPlayerProvider model) => model.currentPlaylistSelection,
            builder: (_, Audio currentPlaylistSelection, __) {
              return AudioListTile(
                title: audioItem.metas.title,
                isSelected: currentPlaylistSelection?.metas?.id == audioItem.metas.id,
              );
            },
          );
        },
      ),
    );
  }
}

class AudioListTile extends StatelessWidget {
  const AudioListTile({
    Key key,
    @required this.title,
    this.isSelected = false,
  }) : super(key: key);

  final String title;
  final bool isSelected;

  static final TextStyle _isSelectedTextStyle = TextStyle(
    color: MusicPlayerColors.selected,
  );

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: isSelected ? _isSelectedTextStyle : null,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
