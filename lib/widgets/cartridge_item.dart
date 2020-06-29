import 'package:flutter/material.dart';

import '../config/assets.dart';

class CartRidgeItem extends StatelessWidget {
  const CartRidgeItem({
    Key key,
    @required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          Assets.GAMEBOY_ADVANCE_SP_CARTRIDGE,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
