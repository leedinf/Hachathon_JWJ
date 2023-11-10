import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jwj_plantdo/flower_card.dart';
import 'package:jwj_plantdo/good_page.dart';

class FeedbackPage extends StatefulWidget {
  final Flower flower;
  FeedbackPage({required this.flower});
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String _selectedFeedback = '';
  int _selectedFeedbackNumber = 0;

  Widget _buildListTile(String feedbackOption, int feedbackNumber) {
    return ListTile(
      contentPadding: EdgeInsets.all(15),

      title: Text(feedbackOption,style: TextStyle(
        fontSize: 30
      ),),

      leading: Radio<String>(
        value: feedbackOption,
        groupValue: _selectedFeedback,
        onChanged: (String? value) {
          setState(() {
            _selectedFeedback = value ?? '';
            _selectedFeedbackNumber = feedbackNumber;
            print(_selectedFeedbackNumber);
          });
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Color(0xFFD4F2B2),
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
                      child: Text('식물의 상태를 알려주세요!', style: TextStyle(
                          fontSize: 45
                        ),),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
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
                  if(_selectedFeedbackNumber!=0) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(

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
}