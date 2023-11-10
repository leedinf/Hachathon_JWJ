// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:jwj_plantdo/flower_card.dart';
import 'package:jwj_plantdo/home/feedback.dart';

class FeedbackBox extends StatefulWidget {
  final flower;
  const FeedbackBox({
    Key? key,
    required this.flower,
  }) : super(key: key);

  @override
  State<FeedbackBox> createState() => _FeedbackBoxState();
}

class _FeedbackBoxState extends State<FeedbackBox> {
  late List<bool> isCheckedList;
  @override
  void initState() {
    super.initState();
    // feedback의 길이만큼 false로 초기화된 리스트를 생성합니다.
    isCheckedList = List<bool>.filled(widget.flower.feedback.length, false);
  }

  void handleCheckedChanged(int index, bool newValue) {
    setState(() {
      isCheckedList[index] = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      //feedback container
      padding: EdgeInsets.fromLTRB(
          width * 0.02, height * 0.01, width * 0.02, height * 0.01),
      margin: const EdgeInsets.all(10),
      height: height * 0.38,
      width: width - 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List<Widget>.generate(
          widget.flower.feedback.length > 5 ? 5 : widget.flower.feedback.length,
          (int i) => BuildFeedback(idx: widget.flower.feedback[i]),
        ),
      ),
    );
  }
}
