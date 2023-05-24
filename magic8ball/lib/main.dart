import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Ask me anything'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: MagicPage(),
    ),
  ));
}

class MagicPage extends StatefulWidget {
  const MagicPage({super.key});

  @override
  State<MagicPage> createState() => _MagicPageState();
}

class _MagicPageState extends State<MagicPage> {
  int ballNo = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: (() {
                setState(() {
                  ballNo = Random().nextInt(5) + 1;
                });
              }),
              child: Image.asset('images/ball$ballNo.png'),
            ),
          ),
        ],
      ),
    );
  }
}
