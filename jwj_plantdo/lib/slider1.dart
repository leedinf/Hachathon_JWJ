import 'package:flutter/material.dart';

class Slider1 extends StatefulWidget {
  const Slider1({super.key});

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider1> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Selected Number:',
          ),
          Text(
            '${_currentSliderValue.round()}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Slider(
              value: _currentSliderValue,
              min: 0,
              max: 100,
              divisions: 100,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
