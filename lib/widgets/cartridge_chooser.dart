import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cartridge.dart';
import '../system.dart';
import 'cartridge_item.dart';

class CartRidgeChooser extends StatefulWidget {
  CartRidgeChooser({
    Key key,
  }) : super(key: key);

  @override
  _CartRidgeChooserState createState() => _CartRidgeChooserState();
}

class _CartRidgeChooserState extends State<CartRidgeChooser> {
  final PageController _pageController = PageController();
  final System _system = System();

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final cartRidges = context.watch<List<CartRidge>>();

    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildGuideText('Swipe down to load cartridge'),
                  _buildGuideText('Swipe up to unload cartridge'),
                ],
              ),
            ),
          ),
          PageView(
            physics: BouncingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int index) => _system.selectCartridge(cartRidges[index]),
            children: [
              for (final cartRidge in cartRidges) CartRidgeItem(name: cartRidge.name),
            ],
          ),
          if (_shouldShowArrowRight(false))
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.arrow_left,
                color: Colors.white,
                size: 48.0,
              ),
            ),
          if (_shouldShowArrowRight(true))
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_right,
                color: Colors.white,
                size: 48.0,
              ),
            ),
        ],
      ),
    );
  }

  Text _buildGuideText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontFamily: 'AtlantisInternational',
      ),
    );
  }

  bool _shouldShowArrowRight(bool arrowRight) {
    if (_pageController.hasClients) {
      double threshold = MediaQuery.of(context).size.width / 4;

      if (arrowRight) {
        return _pageController.offset <= threshold;
      } else {
        return _pageController.offset >= (_pageController.position.maxScrollExtent - threshold);
      }
    }
    return true;
  }
}
