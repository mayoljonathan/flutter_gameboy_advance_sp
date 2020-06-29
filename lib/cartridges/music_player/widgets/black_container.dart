import 'package:flutter/material.dart';

class BlackContainer extends StatelessWidget {
  const BlackContainer({
    Key key,
    this.child,
    this.width,
    this.height,
    this.padding = const EdgeInsets.symmetric(horizontal: 3.0),
  }) : super(key: key);

  final Widget child;
  final double width;
  final double height;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: Colors.black,
            blurRadius: 1.5,
            spreadRadius: 2.0,
          )
        ],
      ),
      width: width,
      height: height,
      padding: padding,
      child: child,
    );
  }
}
