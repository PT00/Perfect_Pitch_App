import 'package:flutter/material.dart';
import 'package:perfect_pitch_app/custom_page_route.dart';
import 'package:perfect_pitch_app/game_page.dart';

import 'end_menu.dart';

Widget blackTile(
    BuildContext context,
    String tone,
    double position,
    double whiteWidth,
    double height,
    int index,
    int correctAnswer,
    int round,
    int score) {
  double blackWidth = whiteWidth * 0.60;
  return Positioned(
    top: 0,
    left: position * whiteWidth - blackWidth / 2,
    width: blackWidth,
    height: height,
    child: GestureDetector(
      onTap: () {
        if (round - 1 == 0) {
          Navigator.of(context).push(CustomPageRoute(
              builder: ((context) => EndMenu(
                    score: correctAnswer == index ? score + 1 : score,
                  ))));
        } else if (correctAnswer == index) {
          Navigator.of(context).push(CustomPageRoute(
              builder: ((context) =>
                  GamePage(score: score + 1, round: round - 1))));
        } else {
          Navigator.of(context).push(CustomPageRoute(
              builder: ((context) =>
                  GamePage(score: score, round: round - 1))));
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: Colors.black),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              tone,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    ),
  );
}
