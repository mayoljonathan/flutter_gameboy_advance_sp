import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/number_counter_provider.dart';

// TODO: Make numberCounterProvider not a singleton, and only runs on cartridge inserted
class NumberCounterCartridge extends StatelessWidget {
  final NumberCounterProvider _numberCounterProvider = NumberCounterProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NumberCounterProvider>.value(
      value: _numberCounterProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Counter'),
      ),
      body: Stack(
        children: [
          Center(
            child: Consumer<NumberCounterProvider>(
              builder: (_, NumberCounterProvider model, __) => Text(
                model.counter.toString(),
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('A = increment'),
                  Text('B = decrement'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
