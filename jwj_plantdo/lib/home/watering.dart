// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:jwj_plantdo/flower_card.dart';

class Watering extends StatefulWidget {
  Flower flower;
  Watering({
    Key? key,
    required this.flower,
  }) : super(key: key);

  @override
  State<Watering> createState() => _WateringState();
}

class _WateringState extends State<Watering> {
  late double _currentSlidevalue;
  @override
  void initState() {
    super.initState();
    _currentSlidevalue = widget.flower.watering.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: RotatedBox(
                quarterTurns: 3,
                child: Slider(
                  value: _currentSlidevalue,
                  min: 0,
                  max: 700,
                  divisions: 7, // 0부터 700까지 7개의 구분
                  onChanged: (double value) {
                    setState(() {
                      _currentSlidevalue = value;
                    });
                  },
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '회당 ${_currentSlidevalue.round()}ml',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
