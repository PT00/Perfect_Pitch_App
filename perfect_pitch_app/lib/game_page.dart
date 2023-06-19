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
          SizedBox(
            height: 300,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double whiteWidth = constraints.maxWidth / 7;
                return Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    whiteTile(context, 'C', 0, whiteWidth, 0, index,
                        widget.round, widget.score),
                    whiteTile(context, 'D', 1, whiteWidth, 2, index,
                        widget.round, widget.score),
                    whiteTile(context, 'E', 2, whiteWidth, 4, index,
                        widget.round, widget.score),
                    whiteTile(context, 'F', 3, whiteWidth, 5, index,
                        widget.round, widget.score),
                    whiteTile(context, 'G', 4, whiteWidth, 7, index,
                        widget.round, widget.score),
                    whiteTile(context, 'A', 5, whiteWidth, 9, index,
                        widget.round, widget.score),
                    whiteTile(context, 'B', 6, whiteWidth, 11, index,
                        widget.round, widget.score),
                    blackTile(
                        context,
                        'C#',
                        1,
                        whiteWidth,
                        constraints.maxHeight / 2,
                        1,
                        index,
                        widget.round,
                        widget.score),
                    blackTile(
                        context,
                        'D#',
                        2,
                        whiteWidth,
                        constraints.maxHeight / 2,
                        3,
                        index,
                        widget.round,
                        widget.score),
                    blackTile(
                        context,
                        'F#',
                        4,
                        whiteWidth,
                        constraints.maxHeight / 2,
                        6,
                        index,
                        widget.round,
                        widget.score),
                    blackTile(
                        context,
                        'G#',
                        5,
                        whiteWidth,
                        constraints.maxHeight / 2,
                        8,
                        index,
                        widget.round,
                        widget.score),
                    blackTile(
                        context,
                        'A#',
                        6,
                        whiteWidth,
                        constraints.maxHeight / 2,
                        10,
                        index,
                        widget.round,
                        widget.score),
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
