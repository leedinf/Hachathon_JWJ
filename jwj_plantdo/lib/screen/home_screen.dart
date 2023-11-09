import 'package:flutter/material.dart';
import 'package:jwj_plantdo/appbar/first_appbar.dart';
import 'package:jwj_plantdo/appbar/second_appbar.dart';
import 'package:jwj_plantdo/home/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
    );
  }
}
