import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwj_plantdo/provider.dart';

class BuildFeedback extends ConsumerStatefulWidget {
  final int idx;
  const BuildFeedback({
    Key? key,
    required this.idx,
  }) : super(key: key);

  @override
  ConsumerState<BuildFeedback> createState() => _BuildFeedbackState();
}

class _BuildFeedbackState extends ConsumerState<BuildFeedback> {
  String fdback = '';
  bool ischecked = false;

  @override
  void initState() {
    super.initState();
    ref.read(feedbackControllerProvider);
  }

  @override
  //grow well, too many bugs, leaves_dying, another_problem
  Widget build(BuildContext context) {
    switch (widget.idx) {
      case 0:
        fdback = '  grow well';
      case 1:
        fdback = '  too many bugs';
      case 2:
        fdback = '  leaves dying';
      case 3:
        fdback = '  another problem';
      default:
        fdback = '';
    }
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (fdback.isEmpty) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        padding: const EdgeInsets.all(2),
        alignment: Alignment.centerLeft,
      );
    }
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: height * 0.01),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border:
                    Border.all(color: !ischecked ? Colors.green : Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: FittedBox(
              fit: BoxFit.scaleDown, // 텍스트가 너무 크면 축소합니다.
              child: Text(
                fdback,
                style:
                    TextStyle(color: !ischecked ? Colors.black : Colors.grey),
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                ischecked = !ischecked;
              });
            },
            icon: Icon(
                !ischecked ? Icons.check_box_outline_blank : Icons.check_box)),
      ],
    );
  }
}
