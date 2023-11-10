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
      title: Text(feedbackOption,style: TextStyle(
        fontSize: 24
      ),),
      leading: Radio<String>(
        value: feedbackOption,
        groupValue: _selectedFeedback,
        onChanged: (String? value) {
          setState(() {
            _selectedFeedback = value ?? '';
            _selectedFeedbackNumber = feedbackNumber;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(height: MediaQuery.of(context).size.height*0.25,color: Color(0xFFA5E166)),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildListTile('no leafs1', 1),
                _buildListTile('no leafs2', 2),
                _buildListTile('no leafs3', 3),
                _buildListTile('no leafs4', 4),
              ],
            ),
          ),
          Container(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GoodPage(flower: widget.flower),
                  ),
                );
              },
              backgroundColor: Colors.green.withOpacity(0.7),
              child: const Icon(Icons.send),
            ),
          ),
          Container(height: MediaQuery.of(context).size.height*0.25,color: Color(0xFFA5E166)),
        ],
      ),
    );
  }
}