import 'package:flutter/material.dart';
import 'package:perfect_pitch_app/custom_page_route.dart';
import 'package:perfect_pitch_app/end_menu.dart';
import 'package:perfect_pitch_app/game_page.dart';

class WhiteTile extends StatefulWidget {
  final BuildContext context;
  final String tone;
  final double position;
  final double whiteWidth;
  final int index;
  final int correctAnswer;
  final int round;
  final int score;

  WhiteTile({
    required this.context,
    required this.tone,
    required this.position,
    required this.whiteWidth,
    required this.index,
    required this.correctAnswer,
    required this.round,
    required this.score,
  });

  @override
  _WhiteTileState createState() => _WhiteTileState();
}

class _WhiteTileState extends State<WhiteTile> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: widget.position * widget.whiteWidth,
      width: widget.whiteWidth,
      bottom: 0,
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            isPressed = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            isPressed = false;
          });
          if (widget.round - 1 == 0) {
            Navigator.of(widget.context).push(
              CustomPageRoute(
                builder: ((context) => EndMenu(
                      score: widget.correctAnswer == widget.index
                          ? widget.score + 1
                          : widget.score,
                    )),
              ),
            );
          } else if (widget.correctAnswer == widget.index) {
            Navigator.of(widget.context).push(
              CustomPageRoute(
                builder: ((context) => GamePage(
                      score: widget.score + 1,
                      round: widget.round - 1,
                    )),
              ),
            );
          } else {
            Navigator.of(widget.context).push(
              CustomPageRoute(
                builder: ((context) => GamePage(
                      score: widget.score,
                      round: widget.round - 1,
                    )),
              ),
            );
          }
        },
        onTapCancel: () {
          setState(() {
            isPressed = false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isPressed
                ? Color.fromARGB(
                    255, 191, 211, 227) // Darker color when pressed
                : Color.fromARGB(255, 223, 235, 245),
            border: Border.all(color: Color.fromARGB(221, 26, 89, 216)),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Text(widget.tone),
            ),
          ),
        ),
      ),
    );
  }
}
