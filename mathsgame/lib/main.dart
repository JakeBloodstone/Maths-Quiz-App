import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Math Quiz Game',
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      initialRoute: '/game-menu',
      routes: {
        '/game-menu': (context) => GameMenu(),
        '/level1': (context) => Level1Screen(),
        '/level2': (context) => Level2Screen(),
        '/level3': (context) => Level3Screen(),
      },
    ),
  );
}

class YellowBackground extends StatelessWidget {
  final double? width;
  final double? height;

  YellowBackground({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      color: Colors.yellow,
      height: height ?? MediaQuery.of(context).size.height,
      width: width ?? MediaQuery.of(context).size.width,
    );
  }
}

class GameMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 60),
              child: YellowBackground(
                  // width: 325,
                  // height: 550,
                  ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBar(
                title: Text('Math Quiz Game'),
                backgroundColor: Colors.red,
              ),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Text(
                  'This is a Math Quiz Game. Do your best as each level is 10 questions each!',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Select a level:',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 90,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/level1');
                        },
                        child: Text(
                          'Level 1',
                          style: TextStyle(
                            color: Color(0xFF27A1C4),
                            fontSize: (30),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: 300,
                      height: 90,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/level2');
                        },
                        child: Text(
                          'Level 2',
                          style: TextStyle(
                            color: Color(0xFF198542),
                            fontSize: (30),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: 300,
                      height: 90,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/level3');
                        },
                        child: Text(
                          'Level 3',
                          style: TextStyle(
                            color: Color(0xFFA51D31),
                            fontSize: (30),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                    //Invisble box at the bottom to keep the other Sized Boxes above the bottom
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Level1Screen extends StatefulWidget {
  @override
  _Level1ScreenState createState() => _Level1ScreenState();
}

class _Level1ScreenState extends State<Level1Screen> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final List<Map<String, Object>> _level1Questions = [
    // list of quiz questions for Level 1
    {
      'questionText': 'What is 5 + 3?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '8', 'score': 1},
        {'text': '10', 'score': 0},
        {'text': '12', 'score': 0},
      ],
    },
    {
      'questionText': 'What is 12 - 8?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '3', 'score': 0},
        {'text': '4', 'score': 1},
        {'text': '6', 'score': 0},
      ],
    },
    {
      'questionText': 'What is 2 + 2?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '4', 'score': 1},
        {'text': '6', 'score': 0},
        {'text': '8', 'score': 0},
      ],
    },
    {
      'questionText': 'What is 6 x 4?',
      'answers': [
        {'text': '10', 'score': 0},
        {'text': '18', 'score': 0},
        {'text': '24', 'score': 1},
        {'text': '36', 'score': 0},
      ],
    },
    {
      'questionText': 'What is 9 ÷ 3?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '3', 'score': 1},
        {'text': '4', 'score': 0},
        {'text': '6', 'score': 0},
      ],
    },
    {
      'questionText': 'What is 12 ÷ 3?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '4', 'score': 1},
        {'text': '12', 'score': 0},
        {'text': '8', 'score': 0},
      ],
    },
    {
      'questionText': 'What is 8 x 3?',
      'answers': [
        {'text': '24', 'score': 1},
        {'text': '8', 'score': 0},
        {'text': '11', 'score': 0},
        {'text': '16', 'score': 0},
      ],
    },
    {
      'questionText': 'What is 20 ÷ 2?',
      'answers': [
        {'text': '18', 'score': 0},
        {'text': '12', 'score': 0},
        {'text': '15', 'score': 0},
        {'text': '10', 'score': 1},
      ],
    },
    {
      'questionText': 'What is 9 ÷ 3?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '3', 'score': 1},
        {'text': '4', 'score': 0},
        {'text': '6', 'score': 0},
      ],
    },
    {
      'questionText': 'What is 5 x 5?',
      'answers': [
        {'text': '10', 'score': 0},
        {'text': '25', 'score': 1},
        {'text': '30', 'score': 0},
        {'text': '20', 'score': 0},
      ],
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex++;
    });
  }

  void _goToGameMenu() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 1 Quiz'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _goToGameMenu,
        ),
        backgroundColor: Color(0xFF27A1C4),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 60, 0),
            child: Text(
              'Score: $_totalScore',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      body: _questionIndex < _level1Questions.length
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                    ),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Text(
                      _level1Questions[_questionIndex]['questionText']
                          .toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF27A1C4),
                      ),
                    ),
                  ),
                  ...(_level1Questions[_questionIndex]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 20.5, horizontal: 20),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () =>
                              _answerQuestion(answer['score'] as int),
                          child: Text(
                            answer['text'].toString(),
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList()
                ],
              ),
            )
          : Center(
              child: Text(
                'Congratulations for having reached the end of the level. This is how well you have done: $_totalScore',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
    );
  }
}

class Level2Screen extends StatefulWidget {
  @override
  _Level2ScreenState createState() => _Level2ScreenState();
}

class _Level2ScreenState extends State<Level2Screen> {
  int _questionIndex = 0;
  int _totalScore = 0;
  int _timeLeft = 20;
  Timer? _timer;
  final List<Map<String, Object>> _level2Questions = [
    // list of quiz questions for Level 2

    {
      'questionText': 'What is 32 + 32?',
      'answers': [
        {'text': '84', 'score': 0},
        {'text': '64', 'score': 1},
        {'text': '32', 'score': 0},
        {'text': '70', 'score': 0},
      ],
    },
    {
      'questionText': 'What is 32 + 16?',
      'answers': [
        {'text': '16', 'score': 0},
        {'text': '9', 'score': 0},
        {'text': '2', 'score': 1},
        {'text': '64', 'score': 0},
      ],
    },
    {
      'questionText': 'What does 9 x 5 multiply by?',
      'answers': [
        {'text': '95', 'score': 0},
        {'text': '45', 'score': 1},
        {'text': '50', 'score': 0},
        {'text': '40', 'score': 0},
      ],
    },
    {
      'questionText': 'What is 5 x 12?',
      'answers': [
        {'text': '25', 'score': 0},
        {'text': '50', 'score': 0},
        {'text': '60', 'score': 1},
        {'text': '55', 'score': 0},
      ],
    },
    {
      'questionText': 'What is 121 ÷ 11?',
      'answers': [
        {'text': '11', 'score': 0},
        {'text': '121', 'score': 1},
        {'text': '21', 'score': 0},
        {'text': '12', 'score': 0},
      ],
    },
    {
      'questionText': 'What is 25 ÷ 5?',
      'answers': [
        {'text': '10', 'score': 0},
        {'text': '5', 'score': 1},
        {'text': '20', 'score': 0},
        {'text': '5', 'score': 0},
      ],
    },
    {
      'questionText': 'What is two by two?',
      'answers': [
        {'text': '7', 'score': 0},
        {'text': '6', 'score': 0},
        {'text': '4', 'score': 1},
        {'text': '9', 'score': 0},
      ],
    },
    {
      'questionText': 'What is three by seven?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '3', 'score': 1},
        {'text': '4', 'score': 0},
        {'text': '6', 'score': 0},
      ],
    },
    {
      'questionText': 'What is 20% of 10?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '3', 'score': 0},
        {'text': '4', 'score': 0},
        {'text': '2', 'score': 1},
      ],
    },
    {
      'questionText': 'What is 10 divided by 5?',
      'answers': [
        {'text': '2', 'score': 1},
        {'text': '7', 'score': 0},
        {'text': '6', 'score': 0},
        {'text': '5', 'score': 0},
      ],
    },
  ];

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _timer?.cancel();
          _showFailedDialog();
        }
      });
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    _timeLeft = 20;
    _startTimer();
  }

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex++;
      _resetTimer();
    });
  }

  void _showFailedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Time is up!'),
            content: Text(
                'You ran out of time unfortunately. Better luck next time o-o)/'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _goToGameMenu();
                },
                child: Text('OK'),
              )
            ]);
      },
    );
  }

  void _goToGameMenu() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 2 Quiz'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _goToGameMenu,
        ),
        backgroundColor: Color(0xFF198542),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 60, 0),
            child: Text(
              'Score: $_totalScore',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      body: _questionIndex < _level2Questions.length
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 73,
                    child: Text(
                      _level2Questions[_questionIndex]['questionText']
                          .toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF198542),
                      ),
                    ),
                  ),
                  Text(
                    'Time left: $_timeLeft',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF198542),
                    ),
                  ),
                  ...(_level2Questions[_questionIndex]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 20.5, horizontal: 20),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () =>
                              _answerQuestion(answer['score'] as int),
                          child: Text(
                            answer['text'].toString(),
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF198542),
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                        ),
                      ),
                    );
                  }).toList()
                ],
              ),
            )
          : Center(
              child: Text(
                'Congratulations for having reached the end of the level. This is how well you have done: $_totalScore',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
    );
  }
}

class Level3Screen extends StatefulWidget {
  @override
  _Level3ScreenState createState() => _Level3ScreenState();
}

class _Level3ScreenState extends State<Level3Screen> {
  int _questionIndex = 0;
  int _totalScore = 0;
  int _timeLeft = 10;
  Timer? _timer;
  final List<Map<String, Object>> _level3Questions = [
    // list of quiz questions for Level 3

    {
      'questionText': 'What is 5 + 30?',
      'answers': [
        {'text': '40', 'score': 0},
        {'text': '35', 'score': 1},
        {'text': '25', 'score': 0},
        {'text': '30', 'score': 0},
      ],
    },
    {
      'questionText': 'What is 10 x 20?',
      'answers': [
        {'text': '10', 'score': 0},
        {'text': '50', 'score': 0},
        {'text': '200', 'score': 1},
        {'text': '20', 'score': 0},
      ],
    },
    {
      'questionText': 'What is nine by 8',
      'answers': [
        {'text': '88', 'score': 0},
        {'text': '64', 'score': 0},
        {'text': '80', 'score': 0},
        {'text': '72', 'score': 1},
      ],
    },
    {
      'questionText': 'What is 30 ÷ 3?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '10', 'score': 1},
        {'text': '4', 'score': 0},
        {'text': '6', 'score': 0},
      ],
    },
    {
      'questionText': 'What is 48 divided by 12?',
      'answers': [
        {'text': '4', 'score': 1},
        {'text': '8', 'score': 0},
        {'text': '48', 'score': 0},
        {'text': '12', 'score': 0},
      ],
    },
    {
      'questionText': 'What is two times seven?',
      'answers': [
        {'text': '9', 'score': 0},
        {'text': '9', 'score': 0},
        {'text': '7', 'score': 0},
        {'text': '14', 'score': 1},
      ],
    },
    {
      'questionText': 'What is 72 ÷ 9?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '8', 'score': 1},
        {'text': '', 'score': 0},
        {'text': '6', 'score': 0},
      ],
    },
    {
      'questionText': 'What is 48 divided by 12?',
      'answers': [
        {'text': '4', 'score': 1},
        {'text': '8', 'score': 0},
        {'text': '48', 'score': 0},
        {'text': '12', 'score': 0},
      ],
    },
    {
      'questionText': 'What is two times seven?',
      'answers': [
        {'text': '9', 'score': 0},
        {'text': '9', 'score': 0},
        {'text': '7', 'score': 0},
        {'text': '14', 'score': 1},
      ],
    },
    {
      'questionText': 'What is 72 ÷ 9?',
      'answers': [
        {'text': '2', 'score': 0},
        {'text': '8', 'score': 1},
        {'text': '', 'score': 0},
        {'text': '6', 'score': 0},
      ],
    },
  ];

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _timer?.cancel();
          _showFailedDialog();
        }
      });
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    _timeLeft = 10;
    _startTimer();
  }

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex++;
      _resetTimer();
    });
  }

  void _showFailedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Time is up!'),
            content: Text(
                'You ran out of time unfortunately. Better luck next time o-o)/'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _goToGameMenu();
                },
                child: Text('OK'),
              )
            ]);
      },
    );
  }

  void _goToGameMenu() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 3 Quiz'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _goToGameMenu,
        ),
        backgroundColor: Color(0xFFA51D31),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 60, 0),
            child: Text(
              'Score: $_totalScore',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      body: _questionIndex < _level3Questions.length
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 73,
                    child: Text(
                      _level3Questions[_questionIndex]['questionText']
                          .toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFA51D31),
                      ),
                    ),
                  ),
                  Text(
                    'Time left: $_timeLeft',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFA51D31),
                    ),
                  ),
                  ...(_level3Questions[_questionIndex]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 20.5, horizontal: 20),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () =>
                              _answerQuestion(answer['score'] as int),
                          child: Text(
                            answer['text'].toString(),
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFA51D31),
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                        ),
                      ),
                    );
                  }).toList()
                ],
              ),
            )
          : Center(
              child: Text(
                'Congratulations for having reached the end of the level. This is how well you have done: $_totalScore',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
    );
  }
}
