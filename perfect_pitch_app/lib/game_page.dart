import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:perfect_pitch_app/black_tile.dart';
import 'package:perfect_pitch_app/notes.dart';
import 'package:perfect_pitch_app/white_tile.dart';
import 'package:perfect_pitch_app/user_preferences.dart';

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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(119, 172, 241, 1),
              Color.fromRGBO(62, 104, 163, 1),
              Color.fromARGB(255, 27, 74, 115)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        icon: Icon(Icons.arrow_back_ios_rounded),
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Exo2-Regular'),
                            '${widget.score}/${UserSimplePreferences.getRounds()}'),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () {
                  Timer(const Duration(milliseconds: 0), () async {
                    await player.stop();
                    await player.play(AssetSource(source));
                  });
                },
                icon: const Icon(
                  Icons.music_note_outlined,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  size: 60,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
      ),
    );
  }
}
