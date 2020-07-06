import 'package:flutter/material.dart';

import '../../../config/assets.dart';

class TitleBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          Center(
            child: Text(
              'Music Player',
              style: Theme.of(context).textTheme.headline6,
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
                    style: Theme.of(context).textTheme.caption,
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
