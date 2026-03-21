import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  
  static const String name = 'animated_screen';
  
  const AnimatedScreen ({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;


  void changeShape() {
    
    final random = Random();

    width = random.nextInt(300).toDouble() + 120;
    height = random.nextInt(300).toDouble() + 120;
    color = Color.fromRGBO(
      random.nextInt(256), 
      random.nextInt(256), 
      random.nextInt(256), 
      1
    );
    borderRadius = random.nextInt(50) + 20;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      
      body: Center(
        child: AnimatedContainer(
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          duration: const Duration(seconds: 1),
          curve: Curves.elasticOut,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius),
          ),
        ),),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow_outlined),
        onPressed: () => changeShape(),
      ),
    );
  }
}