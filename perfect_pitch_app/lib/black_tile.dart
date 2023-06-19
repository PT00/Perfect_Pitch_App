import 'package:flutter/material.dart';
import 'package:perfect_pitch_app/custom_page_route.dart';
import 'package:perfect_pitch_app/game_page.dart';
import 'package:perfect_pitch_app/end_menu.dart';

class BlackTile extends StatefulWidget {
  final BuildContext context;
  final String tone;
  final double position;
  final double whiteWidth;
  final double height;
  final int index;
  final int correctAnswer;
  final int round;
  final int score;

  BlackTile({
    required this.context,
    required this.tone,
    required this.position,
    required this.whiteWidth,
    required this.height,
    required this.index,
    required this.correctAnswer,
    required this.round,
    required this.score,
  });

  @override
  _BlackTileState createState() => _BlackTileState();
}

class _BlackTileState extends State<BlackTile> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    double blackWidth = widget.whiteWidth * 0.60;
    return Positioned(
      top: 0,
      left: widget.position * widget.whiteWidth - blackWidth / 2,
      width: blackWidth,
      height: widget.height,
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
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: isPressed ? Colors.grey[800] : Colors.black,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                widget.tone,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
