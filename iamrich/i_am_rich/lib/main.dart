// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Color.fromARGB(255, 114, 32, 128),
      appBar: AppBar(
        title: Center(child: const Text('I am Poor')),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Image(
          image: NetworkImage(
              'https://vanderbiltc4e.com/wp-content/uploads/2017/08/Super-Mario-Avatar-500x500-300x300.jpg'),
        ),
      ),
    ),
  ));
}
