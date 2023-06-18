import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class GamePage extends StatefulWidget {
  final String note;
  final int score;
  final int round;
  final int properNote;
  const GamePage(
      {Key? key,
      required this.note,
      required this.score,
      required this.round,
      required this.properNote})
      : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final player = AudioPlayer();
  @override
  void initState() {
    Timer(Duration(milliseconds: 500), () async {
      await player.play(AssetSource('sounds/c.mp3'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(),
        ),
      ),
    );
  }
}
