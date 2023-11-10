// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:jwj_plantdo/flower_card.dart';
import 'package:jwj_plantdo/home/watering.dart';

class HumiditySet extends StatefulWidget {
  final Flower flower;
  const HumiditySet({
    Key? key,
    required this.flower,
  }) : super(key: key);

  @override
  State<HumiditySet> createState() => _HumiditySetState();
}

class _HumiditySetState extends State<HumiditySet> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(10),
      height: height * 0.38,
      width: width - 40,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 76, 116, 135)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromARGB(255, 76, 116, 135), width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: double.infinity,
                  width: width * 0.6,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'NOW HUMIDITY (%)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  '${widget.flower.humidity}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10000,
                                      color: Color.fromARGB(255, 76, 116, 135)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        width: 1,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 76, 116, 135)),
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'BEST HUMIDITY (%)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Expanded(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  '${widget.flower.best}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10000,
                                      color: Color.fromARGB(255, 76, 116, 135)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                Container()
              ],
            ),
          ),
          Expanded(child: Watering(flower: widget.flower)),
        ],
      ),
    );
  }
}
