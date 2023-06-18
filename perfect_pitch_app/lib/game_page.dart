import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:perfect_pitch_app/custom_page_route.dart';
import 'package:perfect_pitch_app/home_page.dart';
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
    Timer(const Duration(milliseconds: 200), () async {
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
                int count = 0;
                if (widget.round - 2 == 0) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                } else {
                  Navigator.of(context).push(CustomPageRoute(
                      builder: ((context) => GamePage(
                            score: widget.score + 1,
                            round: widget.round - 1,
                          ))));
                }
              },
              child: Text("XDDD"),
            ),
          ),
        ),
      ),
    );
  }
}
