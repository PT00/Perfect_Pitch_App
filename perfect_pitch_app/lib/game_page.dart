import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:perfect_pitch_app/notes.dart';

class GamePage extends StatefulWidget {
  final int score;
  final int round;

  const GamePage({
    Key? key,
    required this.score,
    required this.round,
  }) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final player = AudioPlayer();
  int index = -1;
  String source = '';

  void playSound() {
    var help = randomNote();
    index = randomNote()[0];
    source = randomNote()[1];
    Timer(const Duration(milliseconds: 500), () async {
      await player.play(AssetSource(source));
    });
  }

  @override
  void initState() {
    super.initState();
    playSound();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => GamePage(
                          score: widget.score + 1,
                          round: widget.round - 1,
                        ))));
              },
              child: Text("XDDD"),
            ),
          ),
        ),
      ),
    );
  }
}
