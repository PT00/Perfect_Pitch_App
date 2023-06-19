import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:perfect_pitch_app/black_tile.dart';
import 'package:perfect_pitch_app/notes.dart';
import 'package:perfect_pitch_app/white_tile.dart';

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
    var helper = randomNote();
    index = helper[0];
    source = helper[1];
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              Timer(const Duration(milliseconds: 0), () async {
                await player.stop();
                await player.play(AssetSource(source));
              });
            },
            child: Text("Play again"),
          ),
          SizedBox(
            height: 200,
          ),
          SizedBox(
            height: 300,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double whiteWidth = constraints.maxWidth / 7;
                return Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    WhiteTile(
                      context: context,
                      tone: 'C',
                      position: 0,
                      whiteWidth: whiteWidth,
                      index: 0,
                      correctAnswer: index,
                      round: widget.round,
                      score: widget.score,
                    ),
                    WhiteTile(
                      context: context,
                      tone: 'D',
                      position: 1,
                      whiteWidth: whiteWidth,
                      index: 2,
                      correctAnswer: index,
                      round: widget.round,
                      score: widget.score,
                    ),
                    WhiteTile(
                      context: context,
                      tone: 'E',
                      position: 2,
                      whiteWidth: whiteWidth,
                      index: 4,
                      correctAnswer: index,
                      round: widget.round,
                      score: widget.score,
                    ),
                    WhiteTile(
                      context: context,
                      tone: 'F',
                      position: 3,
                      whiteWidth: whiteWidth,
                      index: 5,
                      correctAnswer: index,
                      round: widget.round,
                      score: widget.score,
                    ),
                    WhiteTile(
                      context: context,
                      tone: 'G',
                      position: 4,
                      whiteWidth: whiteWidth,
                      index: 7,
                      correctAnswer: index,
                      round: widget.round,
                      score: widget.score,
                    ),
                    WhiteTile(
                      context: context,
                      tone: 'A',
                      position: 5,
                      whiteWidth: whiteWidth,
                      index: 9,
                      correctAnswer: index,
                      round: widget.round,
                      score: widget.score,
                    ),
                    WhiteTile(
                      context: context,
                      tone: 'B',
                      position: 6,
                      whiteWidth: whiteWidth,
                      index: 11,
                      correctAnswer: index,
                      round: widget.round,
                      score: widget.score,
                    ),
                    BlackTile(
                      context: context,
                      tone: 'C#',
                      position: 1,
                      whiteWidth: whiteWidth,
                      height: constraints.maxHeight / 2,
                      index: 1,
                      correctAnswer: index,
                      round: widget.round,
                      score: widget.score,
                    ),
                    BlackTile(
                      context: context,
                      tone: 'D#',
                      position: 2,
                      whiteWidth: whiteWidth,
                      height: constraints.maxHeight / 2,
                      index: 3,
                      correctAnswer: index,
                      round: widget.round,
                      score: widget.score,
                    ),
                    BlackTile(
                      context: context,
                      tone: 'F#',
                      position: 4,
                      whiteWidth: whiteWidth,
                      height: constraints.maxHeight / 2,
                      index: 6,
                      correctAnswer: index,
                      round: widget.round,
                      score: widget.score,
                    ),
                    BlackTile(
                      context: context,
                      tone: 'G#',
                      position: 5,
                      whiteWidth: whiteWidth,
                      height: constraints.maxHeight / 2,
                      index: 8,
                      correctAnswer: index,
                      round: widget.round,
                      score: widget.score,
                    ),
                    BlackTile(
                      context: context,
                      tone: 'A#',
                      position: 6,
                      whiteWidth: whiteWidth,
                      height: constraints.maxHeight / 2,
                      index: 10,
                      correctAnswer: index,
                      round: widget.round,
                      score: widget.score,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
