import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child:
              ListView.builder(itemBuilder: (BuildContext context, int index) {
            return const PlantCard();
          }),
        ),
      ],
    );
  }
}

class PlantCard extends StatefulWidget {
  const PlantCard({Key? key}) : super(key: key);

  @override
  State<PlantCard> createState() => _PlantCardState();
}

class _PlantCardState extends State<PlantCard> {
  bool isclicked = false; // 상태를 위젯의 상태로 옮겼습니다.

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        setState(() {
          isclicked = !isclicked; // 토글
          debugPrint('click, now ${isclicked ? "true" : "false"}');
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250), // 마이크로초에서 밀리초로 변경
        curve: Curves.easeIn,
        margin: const EdgeInsets.fromLTRB(4, 4, 4, 4),
        width: MediaQuery.of(context).size.width,
        height: isclicked ? height * 0.5 : height * 0.1, // 상태에 따라 높이 결정
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 2,
              spreadRadius: 2,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.01),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network("https://picsum.photos/250?image=9",
                        height: height * 0.07),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  width: 2,
                  height: height * 0.07,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
                const Text("NAME"),
                Container(
                  width: 2,
                  height: height * 0.07,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
                const Text("JONG"),
                Container(
                  width: 2,
                  height: height * 0.07,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
                const Icon(CupertinoIcons.heart),
                const Text("10"),
              ],
            ),
            if (isclicked)
              const Row(
                children: [],
              ),
          ],
        ),
      ),
    );
  }
}
