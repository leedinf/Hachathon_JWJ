import 'package:flutter/material.dart';
import 'package:jwj_plantdo/flower_detail.dart';
import 'package:jwj_plantdo/flower_card.dart';

class GoodPage extends StatelessWidget {
  final Flower flower;
  const GoodPage({super.key, required this.flower});

  void _navigateToDetailPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FlowerDetailPage(flower: flower)),
    );
  }

  @override
  Widget build(BuildContext context) {
    String imgstr = '';
    if (flower.humidity > flower.best + 5) {
      imgstr = 'assets/full.jpg';
    } else {
      imgstr = 'assets/smileface.gif';
    }

    else{
      imgstr='assets/smile.png';
    }
      return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 40.0, // 상태바의 높이에 따라 조정하세요.
            left: 10.0,
            child: SafeArea(
              child: IconButton(
                icon: Icon(Icons.arrow_back, size: 30.0),
                onPressed: () {
                  // 여기에서 첫 번째 화면으로 이동합니다.
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => FlowerGridPage()),
                        (Route<dynamic> route) => false,
                  );
                },
              ),
            ),
          ),

          Column(
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
                child: Container(
                  height: MediaQuery.of(context).size.height*0.1,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: InkWell(
                    onTap: () => _navigateToDetailPage(context),
                    child: Container(
                      child: FittedBox(child:Text(flower.nickname,style: TextStyle(fontSize:100),), fit: BoxFit.scaleDown)
                  ),
                  )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
