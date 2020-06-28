import 'package:flutter/material.dart';
import 'package:flutter_gameboy_advance_sp/cartridges/music_player/config/music_player_colors.dart';

class ControlButton extends StatefulWidget {
  ControlButton({
    Key key,
    @required this.iconData,
    this.isPressed = false,
  }) : super(key: key);

  final IconData iconData;
  final bool isPressed;

  @override
  _ControlButtonState createState() => _ControlButtonState();
}

class _ControlButtonState extends State<ControlButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: MusicPlayerColors.controlButtonBackground,
            blurRadius: 1.5,
            spreadRadius: 2.0,
          )
        ],
      ),
      child: Container(
        color: MusicPlayerColors.controlButtonBackground,
        child: Icon(
          widget.iconData,
          color: widget.isPressed ? MusicPlayerColors.buttonPressed : Colors.white,
        ),
      ),
    );
  }
}
