import 'package:flutter/material.dart';
import 'package:perfect_pitch_app/game_page.dart';
import 'package:perfect_pitch_app/user_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final roundsController = TextEditingController();
  bool selected = false;
  int rounds = 0;
  double selectedWidthActive = 0;
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
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Play",
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
                        color: Color.fromRGBO(255, 255, 255, 0.35),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 0.75),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: const Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: FittedBox(
                                child: Text(
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(255, 69, 104, 180),
                                        fontFamily: 'Exo2-Regular'),
                                    "You will hear a single note. \nYour goal is to identify the name of the note.\nType the number of rounds, and start!"),
                              ),
                            ),
                          ),
                          SizedBox(height: 150),
                          FractionallySizedBox(
                            widthFactor: 0.6,
                            child: TextFormField(
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 25),
                              controller: roundsController,
                              cursorColor: Colors.blue,
                              keyboardType: TextInputType.number,
                              maxLength: 3,
                              decoration: const InputDecoration(
                                counterText: '',
                                labelText: 'Rounds:',
                                labelStyle: TextStyle(
                                  fontSize: 35,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: 'Exo2-Light',
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 38, 88, 237)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 4, 4, 119)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.1,
                            child: FittedBox(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(
                                      fontFamily: 'Exo2-Regular',
                                    ),
                                    backgroundColor: Colors.white,
                                    foregroundColor:
                                        const Color.fromARGB(255, 69, 104, 180),
                                  ),
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    if (roundsController.text == '' ||
                                        int.parse(roundsController.text) <= 0 ||
                                        int.parse(roundsController.text)
                                            is double) {
                                    } else {
                                      UserSimplePreferences.setRounds(
                                        int.parse(roundsController.text),
                                      );
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: ((context) => GamePage(
                                                score: 0,
                                                round: int.parse(
                                                    roundsController.text),
                                              )),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text("Start")),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
