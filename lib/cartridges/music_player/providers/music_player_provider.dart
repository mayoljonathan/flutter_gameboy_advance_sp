import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../models/music.dart';

class MusicPlayerProvider extends ChangeNotifier {
  static final MusicPlayerProvider _musicPlayerProvider = MusicPlayerProvider._internal();
  factory MusicPlayerProvider() => _musicPlayerProvider;
  MusicPlayerProvider._internal() {
    _init();
  }

  static final List<Music> _musicList = [
    Music(name: 'Flutter - Widget of the Week Intro', path: 'flutter_widget_of_the_week_intro.mp3'),
    Music(name: 'Flutter - Widget of the Week Outro', path: 'flutter_widget_of_the_week_outro.mp3'),
    Music(name: 'Flutter in Focus', path: 'flutter_in_focus.mp3'),
    Music(name: 'Flutter Interact', path: 'flutter_interact.mp3'),
    Music(name: 'Flutter App Highlight Reel', path: 'flutter_app_highlight_reel.mp3'),
  ];
  List<Music> get musicList => _musicList;

  int _musicListIndex = 0;
  int get musicListIndex => _musicListIndex;

  Music get currentMusicSelection => musicList[musicListIndex];

  // Playlist
  List<Audio> _playlist = [];
  List<Audio> get playlist => _playlist;

  Audio _currentPlaylistSelection;
  Audio get currentPlaylistSelection => _currentPlaylistSelection;

  ItemScrollController _itemScrollController = ItemScrollController();
  ItemScrollController get itemScrollController => _itemScrollController;

  // AudioPlayer
  AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer();

  PlayerState _playerState;
  PlayerState get playerState => _playerState;

  Audio _currentAudioPlaying;
  Audio get currentAudioPlaying => _currentAudioPlaying;

  Duration _currentAudioDuration;
  Duration get currentAudioDuration => _currentAudioDuration;

  double _currentAudioCompletion = 0;
  double get currentAudioCompletion => _currentAudioCompletion;

  Duration _currentAudioTotalDuration;
  Duration get currentAudioTotalDuration => _currentAudioTotalDuration;

  CurrentControlButtonState _currentControlButtonState;
  CurrentControlButtonState get currentControlButtonState => _currentControlButtonState;

  bool isCurrentControlButtonState(CurrentControlButtonState button) {
    return button == _currentControlButtonState;
  }

  bool _isLoop = false;
  bool get isLoop => _isLoop;

  bool _isShuffle = false;
  bool get isShuffle => _isShuffle;

  List<Audio> _convertMusicListToPlaylist() {
    List<Audio> playlist = [];
    for (int i = 0; i < _musicList.length; i++) {
      final music = _musicList[i];
      playlist.add(
        Audio(
          'assets/audios/${music.path}',
          metas: Metas(title: music.name, id: music.hashCode.toString()),
        ),
      );
    }

    return playlist;
  }

  void _init() async {
    print('_init');
    _playlist = _convertMusicListToPlaylist();
    _currentPlaylistSelection = playlist.first;

    _audioPlayer.playerState.listen(_onPlayerStateChanged);
    _audioPlayer.currentPosition.listen(_onCurrentPositionChanged);

    _audioPlayer.open(
      Playlist(audios: _playlist),
      loopMode: _isLoop ? LoopMode.playlist : LoopMode.none,
      autoStart: false,
      showNotification: false,
    );

    notifyListeners();
  }

  void unload() {
    _audioPlayer.stop();
  }

  Audio _getCurrentMusic() {
    return _audioPlayer.playlist.audios
        .firstWhere((Audio audio) => audio.metas.id.toString() == currentMusicSelection.hashCode.toString());
  }

  Audio _getCurrentPlayingAudio() {
    return _audioPlayer?.current?.value?.audio?.audio;
  }

  // Controls
  void playOrResume() {
    final Audio selectedAudioInPlaylist = _getCurrentMusic();
    final Audio currentPlayingAudio = _getCurrentPlayingAudio();

    if (selectedAudioInPlaylist == currentPlayingAudio) {
      resume();
    } else {
      _audioPlayer.playlistPlayAtIndex(_musicListIndex);
      _currentControlButtonState = CurrentControlButtonState.play;
      notifyListeners();

      _clearCurrentControlButtonState();
    }
  }

  void pause() {
    _audioPlayer.pause();
    _currentControlButtonState = CurrentControlButtonState.pause;
    notifyListeners();

    _clearCurrentControlButtonState();
  }

  void resume() async {
    _audioPlayer.play();
    _currentControlButtonState = CurrentControlButtonState.play;
    notifyListeners();

    _clearCurrentControlButtonState();
  }

  void stop() {
    _audioPlayer.stop();
    _currentControlButtonState = CurrentControlButtonState.stop;
    notifyListeners();

    _clearCurrentControlButtonState();
  }

  void skipPrevious() {
    // TODO: Debounce here
    _audioPlayer.previous();
    _currentControlButtonState = CurrentControlButtonState.skip_previous;
    notifyListeners();

    _clearCurrentControlButtonState();
  }

  void skipNext() {
    // TODO: Debounce here
    _audioPlayer.next();
    _currentControlButtonState = CurrentControlButtonState.skip_next;
    notifyListeners();

    _clearCurrentControlButtonState();
  }

  void toggleLoop() {
    final LoopMode loopMode = _audioPlayer.loopMode.value;
    if (loopMode == LoopMode.none) {
      _audioPlayer.setLoopMode(LoopMode.playlist);
    } else {
      _audioPlayer.setLoopMode(LoopMode.none);
    }

    _isLoop = !isLoop;
    notifyListeners();
  }

  // TODO: Shuffle play is buggy
  void toggleShuffle() {
    _audioPlayer.toggleShuffle();
    _isShuffle = !isShuffle;

    notifyListeners();
  }

  void _clearCurrentControlButtonState({
    Duration delay = const Duration(milliseconds: 500),
  }) {
    Future.delayed(delay, () {
      _currentControlButtonState = null;
      notifyListeners();
    });
  }

  // Selections
  void playlistSelectDirection(PlaylistSelectDirection playlistSelectDirection) {
    print(currentMusicSelection.name);
    if (playlistSelectDirection == PlaylistSelectDirection.up) {
      if (_musicListIndex != 0) {
        _musicListIndex--;
        _currentPlaylistSelection = _getCurrentMusic();
        notifyListeners();

        _playlistScrollToSelection();
      }
    } else {
      if (_musicListIndex != (_musicList.length - 1)) {
        _musicListIndex++;
        _currentPlaylistSelection = _getCurrentMusic();
        notifyListeners();

        _playlistScrollToSelection();
      }
    }
  }

  void _playlistScrollToSelection() {
    _itemScrollController.scrollTo(
      index: _musicListIndex,
      duration: const Duration(milliseconds: 200),
    );
  }

  // Listeners
  void _onPlayerStateChanged(PlayerState state) {
    print('[_onPlayerStateChanged] $state');
    _playerState = state;

    if (playerState == PlayerState.play) {
      final Audio playingAudio = _getCurrentPlayingAudio();
      _currentAudioPlaying = playingAudio;
    } else if (playerState == PlayerState.stop) {
      _currentAudioPlaying = null;
    }

    notifyListeners();
  }

  void _onCurrentPositionChanged(Duration duration) {
    final Duration currentAudioTotalDuration = _audioPlayer?.current?.value?.audio?.duration;
    _currentAudioDuration = duration;

    if (currentAudioTotalDuration != null) {
      _currentAudioCompletion = currentAudioDuration.inMilliseconds / currentAudioTotalDuration.inMilliseconds;
    }

    notifyListeners();
  }
}

enum CurrentControlButtonState {
  skip_previous,
  play,
  pause,
  stop,
  skip_next,
}

enum PlaylistSelectDirection {
  up,
  down,
}
