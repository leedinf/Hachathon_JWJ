import 'package:flutter/material.dart';
import 'package:jwj_plantdo/flower_card.dart';

class FlowerDetailPage extends StatefulWidget {
  final Flower flower;

  const FlowerDetailPage({super.key, required this.flower});

  @override
  State<FlowerDetailPage> createState() => _FlowerDetailPageState();
}

class _FlowerDetailPageState extends State<FlowerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.flower.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              widget.flower.photoUrl,
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            Text(
              widget.flower.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.flower.nickname,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const Text(''),
          ],
        ),
      ),
    );
  }
}
