import 'package:flutter/material.dart';

class FirstAppbar extends StatefulWidget {
  const FirstAppbar({super.key});

  @override
  State<FirstAppbar> createState() => _FirstAppbarState();
}

class _FirstAppbarState extends State<FirstAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('first'),
    );
  }
}
