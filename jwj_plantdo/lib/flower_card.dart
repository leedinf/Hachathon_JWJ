import 'package:flutter/material.dart';
import 'package:tested/flower_detail.dart';
import 'package:tested/good_page.dart';

class Flower {
  final int id;
  final String name;
  final String nickname;
  final String photoUrl;
  final int humidity;

  Flower({required this.id, required this.name, required this.nickname, required this.humidity,required this.photoUrl});
}

class FlowerGridPage extends StatelessWidget {
  // 예시 데이터 리스트
  final List<Flower> flowers = List.generate(
    24, // 4x3 그리드에 맞게 12명의 Person 인스턴스를 생성
        (index) => Flower(
      id: index,
      name: '이름 ${index + 1}',
      nickname: '별명 ${index + 1}',
      humidity: 30 ,
      photoUrl: 'https://picsum.photos/seed/picsum/100/100', // 이미지 URL
    ),
  );

  @override
  Widget build(BuildContext context) {
    // GridView를 사용하여 카드들을 그리드 형태로 배치
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 한 줄에 3 개의 카드
          crossAxisSpacing: 4.0, // 수평 빈 Space
          mainAxisSpacing: 4.0, // 수직 빈 Space
          childAspectRatio: (1 / 1.2), // 카드의 가로 세로 비율
        ),
        itemCount: flowers.length,
        itemBuilder: (context, index) {
          // 인덱스에 맞는 Person 데이터로 PersonCard 위젯을 생성
          return InkWell(
            onTap: () {
              // 클릭 시 PersonDetailPage로 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GoodPage(flower: flowers[index]),
                ),
              );
            },
            child: FlowerCard(flower: flowers[index]),
          );
        },
      ),
    );
  }
}

class FlowerCard extends StatelessWidget {
  final Flower flower;

  FlowerCard({required this.flower});

  @override
  Widget build(BuildContext context) {
    // 각 카드의 디자인을 구현합니다.
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Image.network(
              flower.photoUrl,
              fit: BoxFit.cover, // 이미지를 카드에 꽉 채웁니다.
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  flower.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  flower.nickname,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}