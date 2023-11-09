import 'package:flutter/material.dart';
import 'package:jwj_plantdo/flower_detail.dart';
import 'package:jwj_plantdo/flower_card.dart';

class BadPage extends StatelessWidget {
  final Flower flower;
  BadPage({required this.flower});

  void _navigateToDetailPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FlowerDetailPage(flower: flower)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          InkWell(
            onTap: () => _navigateToDetailPage(context),
            child: Container(
              width: MediaQuery.of(context).size.width*0.7,
              height: MediaQuery.of(context).size.height*0.7,
              child: Image.asset(
                'assets/smile.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () => _navigateToDetailPage(context),
            child: Card(
              child: ListTile(
                title: Text(flower.name),
                subtitle: Text(flower.nickname),
              ),
            ),
          ),
        ],
      ),
    );
  }
}