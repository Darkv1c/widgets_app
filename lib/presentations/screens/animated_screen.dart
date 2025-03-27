import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  final String name = 'Animated Screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 100;
  double height = 100;
  Color color = Colors.blue;
  BorderRadius borderRadius = BorderRadius.circular(10);

  void changeShape() {
    Random random = Random();

    setState(() {
      width = random.nextInt(200).toDouble() + 50;
      height = random.nextInt(200).toDouble() + 50;
      color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      borderRadius = BorderRadius.circular(random.nextInt(20).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Container')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              curve: Curves.easeOutCubic,
              duration: Duration(seconds: 1),
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: color,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
