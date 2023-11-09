import 'package:flutter/material.dart';

class SecondAppbar extends StatefulWidget {
  const SecondAppbar({super.key});

  @override
  State<SecondAppbar> createState() => _SecondAppbarState();
}

class _SecondAppbarState extends State<SecondAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('second'),
    );
  }
}
