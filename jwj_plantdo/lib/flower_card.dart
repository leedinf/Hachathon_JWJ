import 'package:flutter/material.dart';
import 'package:jwj_plantdo/bad_page.dart';
import 'package:jwj_plantdo/good_page.dart';

class Flower {
  final int id; //번호?
  final String name; //장미
  final String nickname; //콩콩이
  final String photoUrl;
  final int best;
  final int interest;
  final int humidity;
  final int watering;
  final List<int>
      feedback; //grow well, too many bugs, leaves_dying, another_problem

  Flower({
    required this.id,
    required this.name,
    required this.nickname,
    required this.photoUrl,
    required this.interest,
    required this.humidity,
    required this.watering,
    required this.best,
    required this.feedback,
  });
}

class FlowerGridPage extends StatelessWidget {
  // 예시 데이터 리스트
  final List<Flower> flowers = List.generate(
    24, // 4x3 그리드에 맞게 12명의 Person 인스턴스를 생
    (index) => Flower(
        id: index,
        name: '이름 ${index + 1}',
        nickname: '별명 ${index + 1}',
        interest: index * 7 % 4,
        photoUrl: 'https://picsum.photos/seed/picsum/100/100',
        feedback: [5, 7, 2, 20], // 이미지 URL
        watering: 30,
        humidity: 10,
        best: 35),
  );

  FlowerGridPage({super.key});

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
              if (flowers[index].humidity <= flowers[index].best - 5) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BadPage(flower: flowers[index]),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GoodPage(flower: flowers[index]),
                  ),
                );
              }
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

  const FlowerCard({super.key, required this.flower});

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
