import 'package:flutter/material.dart';
import 'dart:math';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // {
  //   'question': 'Your question here?',
  //   'options': ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
  //   'answer': 'Correct Option',
  // },
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What was Java originally called?',
      'options': ['Maple', 'JavaScript', 'Oak', 'Spruce'],
      'answer': 'Oak',
    },
    {
      'question': 'Who is known as the creator of Java?',
      'options': [
        'Dennies Ritchie',
        'James Gosling',
        'Bjarne Stroustrup',
        'Guido van Rossum',
      ],
      'answer': 'James Gosling',
    },
    {
      'question': 'What year was Java Created?',
      'options': ['1990', '1992', '1995', '2000'],
      'answer': '1992',
    },
    {
      'question': 'What is the main purpose of writing source code?',
      'options': [
        'To instruct the computer what to do using readable statements',
        'To interact with hardware directly',
        'To compile other programming languages',
        'To store files',
      ],
      'answer': 'To instruct the computer what to do using readable statements',
    },
    {
      'question': 'Which of the following is a correct way to print in Java?',
      'options': [
        'print("Hello World");',
        'echo("Hello World");',
        'System.out.println("Hello World");',
        'Print.out("Hello World");',
      ],
      'answer': 'System.out.println("Hello World");',
    },
    {
      'question': 'What symbol must end a Java statement?',
      'options': ['Semicolon [;]', 'Colon [:]', 'Period [.]', 'Comma [,]'],
      'answer': 'Semicolon [;]',
    },
    {
      'question': 'Java source code is read:',
      'options': [
        'Randomly',
        'From top to bottom, and left to right',
        'Only bottom to top',
        'From center outward',
      ],
      'answer': 'From top to bottom, and left to right',
    },
    {
      'question': 'What is the Java Virtual Machine (JVM)?',
      'options': [
        'The name of Java’s source code editor',
        'A software-emulated machine that runs Java bytecode',
        'A device driver for Java hardware',
        'An operating system for Java apps',
      ],
      'answer': 'A software-emulated machine that runs Java bytecode',
    },
    {
      'question': 'What is bytecode in Java?',
      'options': [
        'Intermediate code executed by the JVM',
        'Source code written in Java',
        'Binary code run by the CPU',
        'HTML code processed by Java',
      ],
      'answer': 'A. Intermediate code executed by the JVM',
    },
    {
      'question': 'What is the purpose of garbage collection in Java?',
      'options': [
        'To delete files automatically',
        'To free up memory by removing unused objects',
        'To clean the project folder',
        'To compress code for faster loading',
      ],
      'answer': 'To free up memory by removing unused objects',
    },
    {
      'question': 'Which Java component is responsible for class loading?',
      'options': [
        'Class Loader',
        'Byte Loader',
        'Garbage Collector',
        'JavaFX Loader',
      ],
      'answer': 'Class Loader',
    },
    {
      'question': 'Which feature separates local and network class namespaces?',
      'options': [
        'Bytecode compiler',
        'JVM runtime',
        'Class Security',
        'Memory Manager',
      ],
      'answer': 'Class Security',
    },
    {
      'question': 'Which of the following improves code security in Java?',
      'options': [
        'Removing semicolons',
        'Bytecode verification',
        'Allowing unverified class imports',
        'Printing output',
      ],
      'answer': 'Bytecode verification',
    },
    {
      'question': 'What does the Bytecode Verifier do?',
      'options': [
        'Converts source code to machine code',
        'Deletes invalid files',
        'Tests and checks for illegal code',
        'Encrypts Java classes',
      ],
      'answer': 'Tests and checks for illegal code',
    },
    {
      'question': 'What does “System.out.println()” specifically do in Java?',
      'options': [
        'Saves data to a file',
        'Compiles the code',
        'Prints a line of text to the screen',
        'Sends code to the JVM',
      ],
      'answer': 'Prints a line of text to the screen',
    },
  ];

  int _currentIndex = 0;
  String?
  _selectedAnswer;
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _questions.shuffle();
  }

  void _nextQuestion() {
    if (_selectedAnswer == _questions[_currentIndex]['answer']) {
      _score++;
    }

    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedAnswer = null;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (context) =>
                  ResultScreen(score: _score, total: _questions.length),
        ),
      );
    }
  }

  Future<bool> _showConfirmSkipDialog(BuildContext context) async {
    bool skipConfirmed = false;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Color(0xFF19253E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Color(0xFF33415C), width: 2),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Skip this question?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                Text(
                  "You haven't answered this question",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "Are you sure you want to skip?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "You won't be able to return to it later",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 30),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          skipConfirmed = true;
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE74C3C),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Text(
                          'SKIP',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF14ADDF),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Text(
                          'STAY',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    return skipConfirmed;
  }

  @override
  Widget build(BuildContext context) {
    final current = _questions[_currentIndex];
    final isLastQuestion =
        _currentIndex ==
        _questions.length - 1;

    return Scaffold(
      backgroundColor: const Color(0xFF010B1E),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF010B1E),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Image.asset(
                'assets/images/logo.png',
                width: 45,
                height: 45,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 15, 5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFF45B6FE), width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.close, color: Color(0xFF45B6FE)),
                    SizedBox(width: 8),
                    Text(
                      'Close',
                      style: TextStyle(color: Color(0xFF45B6FE), fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              padding: const EdgeInsets.only(right: 25),
              iconSize: 30,
              color: const Color(0xFF45B6FE),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Center(
                    child: Text(
                      'Fundamentals of Java Programming',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Silkscreen',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 2,
                color: const Color(0xFFEF433A),
              ),
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.65,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  border: Border.all(color: Color(0xFFA29193), width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Question ${_currentIndex + 1}/${_questions.length}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Silkscreen',
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFB8A4A4),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF111D33),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 16),
                          Center(
                            child: Text(
                              //QUESTION
                              current['question'],
                              textAlign:
                                  TextAlign
                                      .center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF33415C),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                ...current['options'].asMap().entries.map((
                                  entry,
                                ) {
                                  final index = entry.key;
                                  final option = entry.value;
                                  final isSelected = option == _selectedAnswer;
                                  final bgColor =
                                      index % 2 == 0
                                          ? Color(0xFF19253E)
                                          : Color(0xFF111D33);
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? Colors.blue[100]
                                              : bgColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              option,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color:
                                                    isSelected
                                                        ? Colors.black
                                                        : Colors.white,
                                                fontFamily: 'Montserrat',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _selectedAnswer = option;
                                        });
                                      },
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(top: 20),
                            child:
                                isLastQuestion
                                    ? Container(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed:
                                            _selectedAnswer != null
                                                ? _nextQuestion
                                                : null,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(
                                            0xFF2ECC71,
                                          ),
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            side: BorderSide(
                                              color: Color(0xFF33415C),
                                              width: 2,
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 15,
                                          ),
                                          disabledBackgroundColor:
                                              Color.fromARGB(
                                                (0xFF * 0.5)
                                                    .round(),
                                                0x2E,
                                                0xCC,
                                                0x71,
                                              ),
                                          disabledForegroundColor: Colors.white
                                              .withAlpha(128),
                                        ),
                                        child: const Text(
                                          'SUBMIT',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                    : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.41,
                                          child: ElevatedButton(
                                            onPressed:
                                                _selectedAnswer == null
                                                    ? () async {
                                                      bool shouldSkip =
                                                          await _showConfirmSkipDialog(
                                                            context,
                                                          );
                                                      if (shouldSkip) {
                                                        _nextQuestion();
                                                      }
                                                    }
                                                    : null,
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(
                                                0xFFE74C3C,
                                              ),
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                side: BorderSide(
                                                  color: Color(0xFF33415C),
                                                  width: 2,
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                vertical: 15,
                                              ),
                                              disabledBackgroundColor:
                                                  Color.fromARGB(
                                                    (0xFF * 0.5)
                                                        .round(),
                                                    0xE7,
                                                    0x4C,
                                                    0x3C,
                                                  ),
                                              disabledForegroundColor: Colors
                                                  .white
                                                  .withAlpha(
                                                    128,
                                                  ),
                                            ),
                                            child: const Text(
                                              'SKIP',
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.41,
                                          child: ElevatedButton(
                                            onPressed:
                                                _selectedAnswer != null
                                                    ? _nextQuestion
                                                    : null,
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(
                                                0xFF19253E,
                                              ),
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                side: BorderSide(
                                                  color: Color(0xFF33415C),
                                                  width: 2,
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                vertical: 15,
                                              ),
                                              disabledBackgroundColor:
                                                  Color.fromARGB(
                                                    (0xFF * 0.5)
                                                        .round(),
                                                    0x19,
                                                    0x25,
                                                    0x3E,
                                                  ),
                                              disabledForegroundColor: Colors
                                                  .white
                                                  .withAlpha(
                                                    128,
                                                  ),
                                            ),
                                            child: const Text(
                                              'NEXT',
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  const ResultScreen({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF010B1E),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF010B1E),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Image.asset(
                'assets/images/logo.png',
                width: 45,
                height: 45,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 15, 5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFF45B6FE), width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.close, color: Color(0xFF45B6FE)),
                    SizedBox(width: 8),
                    Text(
                      'Close',
                      style: TextStyle(color: Color(0xFF45B6FE), fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              padding: const EdgeInsets.only(right: 25),
              iconSize: 30,
              color: const Color(0xFF45B6FE),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Center(
                    child: Text(
                      'Fundamentals of Java Programming',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Silkscreen',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 2,
                color: const Color(0xFFEF433A),
              ),
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.65,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  border: Border.all(color: Color(0xFFA29193), width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Quiz Submitted!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Silkscreen',
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF111D33),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 24),
                          Center(
                            child: Text(
                              'Your answers have been successfully submitted.',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: Text(
                              'Thank you for completing the quiz!',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Text(
                            'SCORE',
                            style: TextStyle(
                              color: Color(0xFFB8A4A4),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Silkscreen',
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              color: Color(0xFF19253E),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Color(0xFF33415C),
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '$score / $total',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.41,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      //for answers screen
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(
                                        0xFF0E87C6,
                                      ),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                          color: Color(0xFF33415C),
                                          width: 2,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15,
                                      ),
                                    ),
                                    child: const Text(
                                      'ANSWERS',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.41,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(
                                        0xFF877C7F,
                                      ),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                          color: Color(0xFF33415C),
                                          width: 2,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15,
                                      ),
                                    ),
                                    child: const Text(
                                      'EXIT',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
