import '../../../providers/system_input_provider.dart';
import 'music_player_provider.dart';

class MusicPlayerInputProviderImpl implements SystemInputProvider {
  MusicPlayerProvider _musicPlayer = MusicPlayerProvider();

  @override
  void onActionATap() {
    _musicPlayer.playOrResume();
  }

  @override
  void onActionBTap() {
    _musicPlayer.stop();
  }

  @override
  void onDirectionalUpTap() {
    _musicPlayer.playlistSelectDirection(PlaylistSelectDirection.up);
  }

  @override
  void onDirectionalDownTap() {
    _musicPlayer.playlistSelectDirection(PlaylistSelectDirection.down);
  }

  @override
  void onDirectionalLeftTap() {
    _musicPlayer.skipPrevious();
  }

  @override
  void onDirectionalRightTap() {
    _musicPlayer.skipNext();
  }

  @override
  void onMenuTap() {}

  @override
  void onSelectTap() {}

  @override
  void onShoulderLeftTap() {
    _musicPlayer.toggleLoop();
  }

  @override
  void onShoulderRightTap() {
    _musicPlayer.toggleShuffle();
  }

  @override
  void onStartTap() {
    _musicPlayer.pause();
  }

  @override
  void onStartLongPress() {}

  @override
  void onActionALongPress() {}

  @override
  void onActionBLongPress() {}

  @override
  void onDirectionalDownLongPress() {}

  @override
  void onDirectionalLeftLongPress() {}

  @override
  void onDirectionalRightLongPress() {}

  @override
  void onDirectionalUpLongPress() {}

  @override
  void onMenuLongPress() {}

  @override
  void onSelectLongPress() {}

  @override
  void onShoulderLeftLongPress() {}

  @override
  void onShoulderRightLongPress() {}
}
