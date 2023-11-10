import 'package:flutter/material.dart';
import 'package:jwj_plantdo/flower_card.dart';
import 'package:jwj_plantdo/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
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
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration:

              const BoxDecoration(color: Color.fromARGB(255, 174, 213, 175)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10),
                    child: SizedBox(
                      width: 335,
                      height: 92,
                      child: Text(
                        'Planto-do',
                        style: TextStyle(
                          color: Color(0xFF39840B),
                          fontSize: 72,
                          fontFamily: 'IrishGrover',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    )
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.1,
              ),
              SizedBox(
                width: width * 0.4,
                height: height * 0.15,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    });
                  },
                  child: const Text(
                    '관리자',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              SizedBox(
                width: width * 0.4,
                height: height * 0.15,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FlowerGridPage()));
                    });
                  },
                  child: const Text(
                    '고객',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,fontFamily: 'Jalnan',),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
