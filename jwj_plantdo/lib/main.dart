import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwj_plantdo/flower_card.dart';
import 'package:jwj_plantdo/screen/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Jalnan',
        primaryColor: Colors.green,
      ),
      home: const SelectMenu(),
    );
  }
}

class SelectMenu extends StatefulWidget {
  const SelectMenu({super.key});

  @override
  State<SelectMenu> createState() => _SelectMenuState();
}

class _SelectMenuState extends State<SelectMenu> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Center(
              child: Container(
            width: width * 0.98,
            height: height * 0.99,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 3,
                  spreadRadius: 3,
                  offset: const Offset(5, 5),
                )
              ],
              color: const Color(0xFFE6C069),
            ),
          )),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: width * 0.92,
                height: height * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF91a939),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 3,
                      spreadRadius: 3,
                      offset: const Offset(5, 5),
                    )
                  ],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(width * 0.036, height * 0.012,
                        width * 0.036, height * 0.012),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(20),
                    //   color: const Color(0xffe3da4d),
                    //   boxShadow: [
                    //     BoxShadow(
                    //       color: Colors.black.withOpacity(0.3),
                    //       blurRadius: 3,
                    //       spreadRadius: 3,
                    //       offset: const Offset(5, 5),
                    //     )
                    //   ],
                    // ),
                    child: Text(
                      'Planto-do',
                      style: TextStyle(
                          color: const Color(0xFF39840B),
                          fontSize: 100,
                          fontFamily: 'IrishGrover',
                          fontWeight: FontWeight.w800,
                          height: 0,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 3,
                              offset: const Offset(5, 5),
                            )
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      });
                    },
                    child: Container(
                      width: width * 0.4,
                      height: height * 0.5,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/1_admin.png'),
                            fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 3,
                            spreadRadius: 3,
                            offset: const Offset(5, 5),
                          )
                        ],
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FlowerGridPage()));
                      });
                    },
                    child: Container(
                      width: width * 0.4,
                      height: height * 0.5,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/1_user.png'),
                            fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 3,
                            spreadRadius: 3,
                            offset: const Offset(5, 5),
                          )
                        ],
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
