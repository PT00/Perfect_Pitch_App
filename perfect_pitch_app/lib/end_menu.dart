import 'package:flutter/material.dart';
import 'user_preferences.dart';

class EndMenu extends StatefulWidget {
  final score;
  const EndMenu({super.key, required this.score});

  @override
  State<EndMenu> createState() => _EndMenuState();
}

class _EndMenuState extends State<EndMenu> {
  @override
  void initState() {
    if (widget.score >
        (UserSimplePreferences.getHighScore() == null
            ? 0
            : int.parse(UserSimplePreferences.getHighScore()!))) {
      UserSimplePreferences.setHighScore(widget.score.toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "ScoreBoard",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(122, 232, 242, 1),
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                  ),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Your score: " + widget.score.toString()),
                      Text(
                        UserSimplePreferences.getHighScore() == null
                            ? "0"
                            : UserSimplePreferences.getHighScore().toString(),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                          },
                          child: Text("Play Again"))
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
