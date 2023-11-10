// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:jwj_plantdo/flower_card.dart';
import 'package:jwj_plantdo/provider.dart';

class ShowStatistics extends ConsumerStatefulWidget {
  final Flower flower;
  const ShowStatistics({
    Key? key,
    required this.flower,
  }) : super(key: key);

  @override
  ConsumerState<ShowStatistics> createState() => _ShowStatisticsState();
}

class _ShowStatisticsState extends ConsumerState<ShowStatistics> {
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
          _buildgraph(0),
          _buildgraph(1),
          _buildgraph(2),
          _buildgraph(3),
        ],
      ),
    );
  }

  List<int> fdb = [0, 0, 0, 0];
  Widget _buildgraph(int idx) {
    var feedbackcounter = ref.read(feedbackControllerProvider.notifier);
    fdb[0] = feedbackcounter.getFeedbackCount(widget.flower.nickname, 0);
    fdb[1] = feedbackcounter.getFeedbackCount(widget.flower.nickname, 1);
    fdb[2] = feedbackcounter.getFeedbackCount(widget.flower.nickname, 2);
    fdb[3] = feedbackcounter.getFeedbackCount(widget.flower.nickname, 3);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String fdback = '';
    int sum = fdb[0] + fdb[1] + fdb[2] + fdb[3];
    double dpercent =
        sum > 0 ? ((fdb[idx].toDouble() / sum.toDouble()) * 100) : 0.0;

    String percent = dpercent.toStringAsFixed(2);
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
        Container(
          decoration: const BoxDecoration(color: Colors.green),
          width: width * 0.07,
          height: dpercent == 0 ? 1 : height * 0.3 * dpercent / 100,
        ),
        Text(fdback),
        Text("${fdb[idx]} ($percent%)")
      ],
    );
  }
}
