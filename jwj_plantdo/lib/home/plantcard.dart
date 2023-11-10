import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwj_plantdo/flower_card.dart';
import 'package:jwj_plantdo/home/feedback.dart';

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
  bool isclicked = false; // 상태를 위젯의 상태로 옮겼습니다.
  bool isfeedback = true; // true: 피드백 flase: 습도
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
                Container(
                  width: 140,
                  padding: const EdgeInsets.all(2),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.flowers.nickname,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  width: 2,
                  height: height * 0.07,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
                Container(
                  width: 140,
                  padding: const EdgeInsets.all(2),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.flowers.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
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
                  margin: const EdgeInsets.symmetric(horizontal: 5),
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
                            isfeedback = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: width * 0.4,
                          child: Column(
                            children: [
                              Text(
                                'FEEDBACK',
                                style: TextStyle(
                                    color:
                                        isfeedback ? Colors.black : Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 77,
                                color: isfeedback
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
                            isfeedback = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          width: width * 0.4,
                          child: Column(
                            children: [
                              Text(
                                'HUMIDITY',
                                style: TextStyle(
                                    color: !isfeedback
                                        ? Colors.black
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 77,
                                color: !isfeedback
                                    ? Colors.green
                                    : Colors.lightGreen,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (isfeedback && showContent)
                    Container(
                      //feedback container
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      height: height * 0.33,
                      width: width - 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List<Widget>.generate(
                          widget.flowers.feedback.length > 5
                              ? 5
                              : widget.flowers.feedback.length,
                          (int i) =>
                              BuildFeedback(idx: widget.flowers.feedback[i]),
                        ),
                      ),
                    ),
                  if (!isfeedback && showContent)
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      height: height * 0.33,
                      width: width - 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 76, 116, 135)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 76, 116, 135),
                                  width: 3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: double.infinity,
                                  width: width * 0.6,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text('NOW HUMIDITY (%)'),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Text(
                                              '${widget.flowers.humidity}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 80,
                                                color: Color.fromARGB(
                                                    255, 76, 116, 135),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                      Container(
                                        width: 1,
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 76, 116, 135)),
                                      ),
                                      Expanded(
                                          child: Container(
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text('BEST HUMIDITY (%)'),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Text(
                                              '${widget.flowers.best}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 80,
                                                  color: Color.fromARGB(
                                                      255, 76, 116, 135)),
                                            ),
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                Container()
                              ],
                            ),
                          ),
                          const Column()
                        ],
                      ),
                    ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
