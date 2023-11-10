// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:jwj_plantdo/flower_card.dart';

class ShowStatistics extends StatefulWidget {
  final Flower flower;
  const ShowStatistics({
    Key? key,
    required this.flower,
  }) : super(key: key);

  @override
  State<ShowStatistics> createState() => _ShowStatisticsState();
}

class _ShowStatisticsState extends State<ShowStatistics> {
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
        children: [
          _buildgraph(0),
          _buildgraph(1),
          _buildgraph(2),
          _buildgraph(3),
        ],
      ),
    );
  }

  Widget _buildgraph(int idx) {
    String fdback = '';
    int sum = widget.flower.feedback[0] +
        widget.flower.feedback[1] +
        widget.flower.feedback[2] +
        widget.flower.feedback[3];
    switch (idx) {
      case 0:
        fdback = 'grow well';
      case 1:
        fdback = 'too many bugs';
      case 2:
        fdback = 'leaves dying';
      case 3:
        fdback = 'another problem';
      default:
        fdback = '';
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(fdback),
        Text(
            "${widget.flower.feedback[idx]} (${(widget.flower.feedback[idx].toDouble() / sum.toDouble())* 100}%)")
      ],
    );
  }
}
