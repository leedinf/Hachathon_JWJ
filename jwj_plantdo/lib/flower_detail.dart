import 'package:flutter/material.dart';
import 'package:jwj_plantdo/flower_card.dart';

class FlowerDetailPage extends StatelessWidget {
  final Flower flower;

  FlowerDetailPage({required this.flower});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              flower.photoUrl,
              width: 800,
              height: 800,
              fit: BoxFit.cover,
            ),
            Text(
              flower.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              flower.nickname,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
