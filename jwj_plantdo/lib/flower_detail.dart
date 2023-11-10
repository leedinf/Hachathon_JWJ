import 'package:flutter/material.dart';
import 'package:jwj_plantdo/flower_card.dart';

class FlowerDetailPage extends StatelessWidget {
  final Flower flower;
  FlowerDetailPage({required this.flower});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            child: Image.asset('assets/search.png'),
            height: MediaQuery.of(context).size.height*0.2,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        'https://picsum.photos/seed/picsum/150/150', // Replace with a valid image URL
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height*0.3, // Set your desired height
                      ),
                      Text(
                        flower.nickname,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        flower.name,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Text(
                      'Roses are best known for their large, usually red, double flowers and their strong, distinctive fragrance. They have been celebrated for centuries in many cultures for their beauty and fragrance. Roses are used in perfumes, for ceremonial purposes, and for their medicinal properties.',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.8
              ),
              FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: Colors.green.withOpacity(0.7),
              child: const Icon(Icons.home),
            ),
            ]
          ),
        ],
      ),
    );
  }
}
