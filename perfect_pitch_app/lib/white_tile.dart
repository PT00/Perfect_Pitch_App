// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:perfect_pitch_app/custom_page_route.dart';
import 'package:perfect_pitch_app/end_menu.dart';
import 'package:perfect_pitch_app/game_page.dart';

Widget whiteTile(BuildContext context, String tone, double position,
    double whiteWidth, int index, int correctAnswer, int round, int score) {
  return Positioned(
    top: 0,
    left: position * whiteWidth,
    width: whiteWidth,
    bottom: 0,
    child: GestureDetector(
      onTapUp: (TapUpDetails) {
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
            color: Color.fromARGB(255, 223, 235, 245),
            border: Border.all(color: Color.fromARGB(221, 26, 89, 216))),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0), child: Text(tone)),
        ),
      ),
    ),
  );
}
