import 'package:flutter/material.dart';

import '../providers/system_input_provider.dart';

class CartRidge {
  final String name;
  final Widget widget;
  final SystemInputProvider inputProvider;

  const CartRidge({
    @required this.name,
    @required this.widget,
    @required this.inputProvider,
  });
}
