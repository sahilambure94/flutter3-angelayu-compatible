// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void playSound(int? no) {
    final player = AudioCache();
    player.play('note$no.wav');
  }

  Expanded buildKey({Color? colors, int? audioNumber}) {
    return Expanded(
      child: TextButton(
        onPressed: (() {
          playSound(audioNumber);
        }),
        style: TextButton.styleFrom(
          enableFeedback: false,
          backgroundColor: colors,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        child: Text(''),
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(colors: Colors.red, audioNumber: 1),
              buildKey(colors: Colors.orange, audioNumber: 2),
              buildKey(colors: Colors.yellow, audioNumber: 3),
              buildKey(colors: Colors.green, audioNumber: 4),
              buildKey(colors: Colors.teal, audioNumber: 5),
              buildKey(colors: Colors.blue, audioNumber: 6),
              buildKey(colors: Colors.purple, audioNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
