import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../config/assets.dart';

class BootupScreen extends StatefulWidget {
  const BootupScreen({
    Key key,
    @required this.onFinish,
  }) : super(key: key);

  final VoidCallback onFinish;

  @override
  _BootupScreenState createState() => _BootupScreenState();
}

class _BootupScreenState extends State<BootupScreen> {
  VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(Assets.GAMEBOY_ADVANCE_SP_BOOTUP)
      ..initialize().then((_) {
        _isInitialized = true;

        setState(() {});
        _controller.play();
      });

    _controller.addListener(() {
      final bool _isPlaying = _controller.value.isPlaying;

      if (_isInitialized && !_isPlaying) {
        widget.onFinish();
      }
    });
  }

  @override
  void dispose() {
    debugPrint('Disposing bootup_screen');
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.initialized) return Container(color: Colors.black);

    return VideoPlayer(_controller);
  }
}
