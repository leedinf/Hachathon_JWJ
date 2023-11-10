// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BuildFeedback extends StatefulWidget {
  final int idx;

  const BuildFeedback({
    Key? key,
    required this.idx,
  }) : super(key: key);

  @override
  State<BuildFeedback> createState() => _BuildFeedbackState();
}

class _BuildFeedbackState extends State<BuildFeedback> {
  String fdback = '';
  bool ischecked = false;
  @override
  //grow well, too many bugs, leaves_dying, another_problem
  Widget build(BuildContext context) {
    if (widget.idx == 0) {
      fdback = '  grow well';
    } else if (widget.idx == 1) {
      fdback = '  too many bugs';
    } else if (widget.idx == 2) {
      fdback = '  leaves dying';
    } else if (widget.idx == 3) {
      fdback = '  another problem';
    }

    if (fdback.isEmpty) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        padding: const EdgeInsets.all(2),
        alignment: Alignment.centerLeft,
      );
    }
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(7),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border:
                  Border.all(color: !ischecked ? Colors.green : Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            fdback,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: !ischecked ? Colors.black : Colors.grey),
          ),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              setState(() {
                ischecked = !ischecked;
              });
            },
            icon: Icon(
                !ischecked ? Icons.check_box_outline_blank : Icons.check_box))
      ],
    );
  }
}
