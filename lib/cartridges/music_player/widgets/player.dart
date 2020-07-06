import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

import '../config/music_player_colors.dart';
import '../providers/music_player_provider.dart';
import '../widgets/custom_slider_thumb_rect.dart';
import 'black_container.dart';
import 'control_button.dart';
import 'custom_track_shape.dart';
import 'my_playlist.dart';

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            BlackContainer(
              child: Selector<MusicPlayerProvider, Duration>(
                selector: (_, MusicPlayerProvider model) => model.currentAudioDuration,
                builder: (_, Duration duration, __) {
                  String time = duration == null ? '00:00' : _formatDuration(duration);
                  return Text(time);
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SliderTheme(
                  data: SliderThemeData(
                    thumbShape: CustomSliderThumbRect(
                      thumbColor: MusicPlayerColors.buttonPressed,
                      thumbHeight: 24,
                    ),
                    trackShape: CustomTrackShape(),
                    trackHeight: 16,
                  ),
                  child: Selector<MusicPlayerProvider, double>(
                    selector: (_, MusicPlayerProvider model) => model.currentAudioCompletion,
                    builder: (_, double value, __) => Slider(
                      value: value,
                      min: 0,
                      max: 1,
                      onChanged: null,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 140,
              child: BlackContainer(
                height: 20,
                child: Selector<MusicPlayerProvider, Audio>(
                  selector: (_, MusicPlayerProvider model) => model.currentAudioPlaying,
                  builder: (_, Audio currentAudio, __) => kIsWeb
                      ? Text(
                          currentAudio?.metas?.title ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        )
                      : Marquee(
                          key: UniqueKey(),
                          text: currentAudio?.metas?.title ?? ' ',
                          blankSpace: 75,
                          velocity: 20,
                          startPadding: 8,
                        ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Selector<MusicPlayerProvider, bool>(
              selector: (_, MusicPlayerProvider model) =>
                  model.isCurrentControlButtonState(CurrentControlButtonState.skip_previous),
              builder: (_, bool pressed, __) => ControlButton(
                isPressed: pressed,
                iconData: Icons.skip_previous,
              ),
            ),
            SizedBox(width: 12.0),
            Selector<MusicPlayerProvider, bool>(
              selector: (_, MusicPlayerProvider model) =>
                  model.isCurrentControlButtonState(CurrentControlButtonState.play),
              builder: (_, bool pressed, __) => ControlButton(
                isPressed: pressed,
                iconData: Icons.play_arrow,
              ),
            ),
            SizedBox(width: 12.0),
            Selector<MusicPlayerProvider, bool>(
              selector: (_, MusicPlayerProvider model) =>
                  model.isCurrentControlButtonState(CurrentControlButtonState.pause),
              builder: (_, bool pressed, __) => ControlButton(
                isPressed: pressed,
                iconData: Icons.pause,
              ),
            ),
            SizedBox(width: 12.0),
            Selector<MusicPlayerProvider, bool>(
              selector: (_, MusicPlayerProvider model) =>
                  model.isCurrentControlButtonState(CurrentControlButtonState.stop),
              builder: (_, bool pressed, __) => ControlButton(
                isPressed: pressed,
                iconData: Icons.stop,
              ),
            ),
            SizedBox(width: 12.0),
            Selector<MusicPlayerProvider, bool>(
              selector: (_, MusicPlayerProvider model) =>
                  model.isCurrentControlButtonState(CurrentControlButtonState.skip_next),
              builder: (_, bool pressed, __) => ControlButton(
                isPressed: pressed,
                iconData: Icons.skip_next,
              ),
            ),
            Spacer(),
            BlackContainer(
              child: Selector<MusicPlayerProvider, bool>(
                selector: (_, MusicPlayerProvider model) => model.isLoop,
                builder: (_, bool isLoop, __) => Text(
                  'Repeat',
                  style: TextStyle(
                    color: isLoop ? MusicPlayerColors.selected : null,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.0),
            BlackContainer(
              child: Selector<MusicPlayerProvider, bool>(
                selector: (_, MusicPlayerProvider model) => model.isShuffle,
                builder: (_, bool isShuffle, __) => Text(
                  'Shuffle',
                  style: TextStyle(
                    color: isShuffle ? MusicPlayerColors.selected : null,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.0),
        Expanded(
          child: MyPlaylist(),
        )
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}
