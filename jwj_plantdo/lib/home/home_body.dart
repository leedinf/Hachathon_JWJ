import 'package:flutter/material.dart';
import 'package:jwj_plantdo/flower_card.dart';
import 'package:jwj_plantdo/home/plantcard.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final List<Flower> flowers = List.generate(
    24, // 4x3 그리드에 맞게 12명의 Person 인스턴스를 생성
    (index) => Flower(
        id: index,
        name: '이름 ${index + 1}',
        nickname: '별명 ${index + 1}',
        interest: index * 7 % 4,
        photoUrl: 'https://picsum.photos/seed/picsum/100/100',
        feedback: [3, 2, 0, 1], // 이미지 URL
        watering: 300,
        humidity: 10,
        best: 35),
  );
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 189, 224, 191),
            Color.fromARGB(255, 152, 243, 155),
            Color.fromARGB(255, 189, 224, 191)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        )),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: ListView.builder(
                itemCount: flowers.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return PlantCard(flowers: flowers[index]);
                }),
          ),
        ),
        Positioned(
          bottom: 15,
          right: 15,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            backgroundColor: Colors.green.withOpacity(0.7),
            child: const Icon(Icons.home),
          ),
        )
      ],
    );
  }
}
