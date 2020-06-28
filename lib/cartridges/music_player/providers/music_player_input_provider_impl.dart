import '../../../providers/system_input_provider.dart';
import 'music_player_provider.dart';

class MusicPlayerInputProviderImpl implements SystemInputProvider {
  MusicPlayerProvider _musicPlayer = MusicPlayerProvider();

  @override
  void onActionATap() {
    print('[MusicPlayerInputProviderImpl] A tapped!');
    _musicPlayer.decrement();
  }

  @override
  void onActionBTap() {
    print('[MusicPlayerInputProviderImpl] B tapped!');
    _musicPlayer.increment();
  }

  @override
  void onDirectionalDownTap() {
    print('[MusicPlayerInputProviderImpl] Down tapped!');
  }

  @override
  void onDirectionalLeftTap() {
    print('[MusicPlayerInputProviderImpl] Left tapped!');
  }

  @override
  void onDirectionalRightTap() {
    print('[MusicPlayerInputProviderImpl] Right tapped!');
  }

  @override
  void onDirectionalUpTap() {
    print('[MusicPlayerInputProviderImpl] Up tapped!');
  }

  @override
  void onMenuTap() {
    print('[MusicPlayerInputProviderImpl] Menu tapped!');
  }

  @override
  void onSelectTap() {
    print('[MusicPlayerInputProviderImpl] Select tapped!');
  }

  @override
  void onShoulderLeftTap() {
    print('[MusicPlayerInputProviderImpl] Shoulder-L tapped!');
  }

  @override
  void onShoulderRightTap() {
    print('[MusicPlayerInputProviderImpl] Shoulder-R tapped!');
  }

  @override
  void onStartTap() {
    print('[MusicPlayerInputProviderImpl] Start tapped!');
  }
}
