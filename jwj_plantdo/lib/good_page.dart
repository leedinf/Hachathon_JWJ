import 'package:flutter/material.dart';
import 'package:jwj_plantdo/flower_detail.dart';
import 'package:jwj_plantdo/flower_card.dart';

class GoodPage extends StatelessWidget {
  final Flower flower;
  GoodPage({required this.flower});

  void _navigateToDetailPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FlowerDetailPage(flower: flower)),
    );
  }

  @override
  Widget build(BuildContext context) {
    String imgstr='';
    if(flower.humidity>flower.best+5){
      imgstr='assets/full.jpg';
    }
    else{
      imgstr='assets/smile.png';
    }
      return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          Center(
            child: InkWell(
              onTap: () => _navigateToDetailPage(context),
              child: Container(
                width: MediaQuery.of(context).size.width*0.7,
                height: MediaQuery.of(context).size.height*0.7,
                child: Image.asset(
                  imgstr,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: InkWell(
              onTap: () => _navigateToDetailPage(context),
              child: Card(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}