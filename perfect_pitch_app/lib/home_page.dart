import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final roundsController = TextEditingController();
  int rounds = 0;

  double _currentCounter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: [
                        FractionallySizedBox(
                          widthFactor: 0.4,
                          child: TextFormField(
                            controller: roundsController,
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            decoration: const InputDecoration(
                              counterText: '',
                              labelText: 'Rounds',
                              labelStyle: TextStyle(
                                color: Color(0xFF6200EE),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF6200EE)),
                              ),
                            ),
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
    );
  }
}
