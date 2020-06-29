import 'package:flutter/material.dart';

import '../../../config/assets.dart';

class TitleBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Stack(
        children: [
          Center(
            child: Text(
              'Music Player',
              style: TextStyle(
                fontSize: 36.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Built with Flutter',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Image.asset(
                    Assets.FLUTTER_LOGO_PIXELATED,
                    height: 18,
                    width: 18,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
