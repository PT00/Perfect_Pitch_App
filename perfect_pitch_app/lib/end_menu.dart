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
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/GamePageBackground.jpg'),
        )),
        child: Center(
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
                      fontFamily: 'Exo2-Regular',
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.3),
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                    ),
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, bottom: 10),
                            child: Text(
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontFamily: 'Exo2-Light',
                                ),
                                "Score: " + widget.score.toString()),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, bottom: 80),
                            child: Text(
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontFamily: 'Exo2-Light',
                                ),
                                "High Score: ${UserSimplePreferences.getHighScore() == null ? "0" : UserSimplePreferences.getHighScore().toString()}"),
                          ),
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
      ),
    );
  }
}
