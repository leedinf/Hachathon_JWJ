import 'package:flutter/material.dart';
import 'package:jwj_plantdo/flower_card.dart';
import 'package:jwj_plantdo/good_page.dart';
import 'package:jwj_plantdo/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

class FeedbackPage extends ConsumerStatefulWidget {
  final Flower flower;
  const FeedbackPage({Key? key, required this.flower}) : super(key: key);
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends ConsumerState<FeedbackPage> {
  String _selectedFeedback = '';
  int _selectedFeedbackNumber = 0;

  @override
  void initState() {
    super.initState();
    // "ref"는 StatefulWidget의 모든 생명주기 상에서 사용할 수 있습니다.
    ref.read(feedbackControllerProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD4F2B2),
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: 800,
              height: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        '식물의 상태를 알려주세요!',
                        style: TextStyle(fontSize: 45),
                      ),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      _buildListTile('grow well', 1),
                      _buildListTile('too many bugs', 2),
                      _buildListTile('leaves dying', 3),
                      _buildListTile('another problem', 4),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 30,
            bottom: 30,
            child: Container(
              child: FloatingActionButton(
                onPressed: () {
                  //김명준함수(_selectedFeedbackNumber)
                  ref
                      .read(feedbackControllerProvider.notifier)
                      .incrementFeedback(widget.flower.nickname,
                          _selectedFeedbackNumber - 1, 1);
                  debugPrint(
                      '${widget.flower.nickname} $_selectedFeedbackNumber');
                  if (_selectedFeedbackNumber != 0) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Center(child: Text('고마워요 !')),
                      duration: Duration(seconds: 3), // 메시지가 표시되는 시간 (3초)
                    ));

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoodPage(flower: widget.flower),
                      ),
                    );
                  }
                },
                backgroundColor: Colors.green.withOpacity(0.7),
                child: const Icon(Icons.send),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String feedbackOption, int feedbackNumber) {
    return ListTile(
      contentPadding: const EdgeInsets.all(15),
      title: Text(
        feedbackOption,
        style: const TextStyle(fontSize: 30),
      ),
      leading: Radio<String>(
        value: feedbackOption,
        groupValue: _selectedFeedback,
        onChanged: (String? value) {
          setState(() {
            _selectedFeedback = value ?? '';
            _selectedFeedbackNumber = feedbackNumber;
            debugPrint('$_selectedFeedbackNumber');
          });
        },
      ),
    );
  }
}
