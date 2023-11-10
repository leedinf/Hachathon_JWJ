import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwj_plantdo/flower_card.dart';
import 'package:jwj_plantdo/home/feedback_box.dart';
import 'package:jwj_plantdo/home/humidityset.dart';
import 'package:jwj_plantdo/home/show_statistics.dart';

class PlantCard extends StatefulWidget {
  final Flower flowers;
  const PlantCard({
    Key? key,
    required this.flowers,
  }) : super(key: key);
  @override
  State<PlantCard> createState() => _PlantCardState();
}

class _PlantCardState extends State<PlantCard> {
  bool isclicked = false; // 카드 여닫기
  int isfeedback = 0; // 피드백 통계 물
  bool showContent = false; // 내용을 표시할지 말지 결정하는 새로운 상태 변수

  void toggleCard() {
    setState(() {
      isclicked = !isclicked;
      // 애니메이션 시간 후에 showContent 상태를 업데이트합니다.
      if (isclicked) {
        Future.delayed(const Duration(milliseconds: 250), () {
          setState(() {
            showContent = true;
          });
        });
      } else {
        showContent = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    //double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        toggleCard();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250), // 마이크로초에서 밀리초로 변경
        curve: Curves.easeIn,
        margin: const EdgeInsets.fromLTRB(4, 4, 4, 4),
        width: MediaQuery.of(context).size.width,
        height: isclicked ? height * 0.55 : height * 0.1, // 상태에 따라 높이 결정
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
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 2,
                  height: height * 0.07,
                  decoration: const BoxDecoration(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(widget.flowers.photoUrl,
                        height: height * 0.07),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  width: 2,
                  height: height * 0.07,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    width: 130,
                    padding: const EdgeInsets.all(2),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.flowers.nickname,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  width: 2,
                  height: height * 0.07,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    width: 130,
                    padding: const EdgeInsets.all(2),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.flowers.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  width: 2,
                  height: height * 0.07,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
                const Spacer(),
                const Icon(
                  CupertinoIcons.heart,
                  color: Colors.pink,
                ),
                Text("  ${widget.flowers.interest} "),
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 7),
                  width: 2,
                  height: height * 0.07,
                  decoration: const BoxDecoration(color: Colors.white),
                ),
              ],
            ),
            if (isclicked && showContent)
              Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isfeedback = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: width * 0.3,
                          child: Column(
                            children: [
                              Text(
                                'FEEDBACK',
                                style: TextStyle(
                                    color: isfeedback == 0
                                        ? Colors.black
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 77,
                                color: isfeedback == 0
                                    ? Colors.green
                                    : Colors.lightGreen,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isfeedback = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: width * 0.3,
                          child: Column(
                            children: [
                              Text(
                                'STATISTICS',
                                style: TextStyle(
                                    color: isfeedback == 1
                                        ? Colors.black
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 77,
                                color: isfeedback == 1
                                    ? Colors.green
                                    : Colors.lightGreen,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isfeedback = 2;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: width * 0.3,
                          child: Column(
                            children: [
                              Text(
                                'HUMIDITY',
                                style: TextStyle(
                                    color: isfeedback == 2
                                        ? Colors.black
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 77,
                                color: isfeedback == 2
                                    ? Colors.green
                                    : Colors.lightGreen,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (isfeedback == 0 && showContent)
                    FeedbackBox(flower: widget.flowers),
                  if (isfeedback == 1 && showContent)
                    ShowStatistics(flower: widget.flowers),
                  if (isfeedback == 2 && showContent)
                    HumiditySet(flower: widget.flowers),
                ],
              )
          ],
        ),
      ),
    );
  }
}
