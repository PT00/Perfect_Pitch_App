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
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.35),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
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
                                style: const TextStyle(
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
                            child: Row(
                              children: [
                                Text(
                                    style: const TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontFamily: 'Exo2-Light',
                                    ),
                                    "High Score: ${UserSimplePreferences.getHighScore() == null ? "0" : UserSimplePreferences.getHighScore().toString()}"),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 4.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    width: MediaQuery.of(context).size.height *
                                        0.04,
                                    child: FittedBox(
                                      child: IconButton(
                                        onPressed: () => showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text('Are you sure ?'),
                                            content: const Text(
                                                'Your High Score will be erased.'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Cancel'),
                                                child: const Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        108, 132, 255, 1),
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    UserSimplePreferences
                                                        .setHighScore('0');
                                                  });
                                                  Navigator.pop(context, 'OK');
                                                },
                                                child: const Icon(
                                                  Icons.done_all_sharp,
                                                  color: Color.fromRGBO(
                                                      108, 132, 255, 1),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        icon: const Icon(
                                          Icons.close,
                                          color:
                                              Color.fromARGB(255, 247, 55, 55),
                                          size: 35,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(
                                fontFamily: 'Exo2-Regular',
                              ),
                              backgroundColor: Colors.white,
                              foregroundColor:
                                  Color.fromARGB(255, 69, 104, 180),
                            ),
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
