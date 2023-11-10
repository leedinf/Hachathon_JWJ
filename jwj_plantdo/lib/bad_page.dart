import 'package:flutter/material.dart';
import 'package:jwj_plantdo/feed_back.dart';
import 'package:jwj_plantdo/flower_detail.dart';
import 'package:jwj_plantdo/flower_card.dart';

class BadPage extends StatelessWidget {
  final Flower flower;
  const BadPage({super.key, required this.flower});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FeedbackPage(flower: flower),
                ),
              );
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Image.asset(
                'assets/cry.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FeedbackPage(flower: flower),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Center(child: Text(flower.name)),
                subtitle: Center(child: Text(flower.nickname)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
