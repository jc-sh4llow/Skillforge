import 'package:flutter/material.dart'; // Imports the Flutter material design package
import 'dart:math'; // Import for additional randomization functions if needed

// Main quiz screen widget that maintains state
class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key}); // Constructor with optional key parameter

  @override
  // Creates the mutable state for this widget
  State<QuizScreen> createState() => _QuizScreenState();
}

// The state class for the QuizScreen widget
class _QuizScreenState extends State<QuizScreen> {
  // Comment template for developers to add more questions to the quiz
  // {
  //   'question': 'Your question here?',
  //   'options': ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
  //   'answer': 'Correct Option',
  // },

  // List of questions for the quiz
  // Each question is a Map with 'question', 'options', and 'answer' keys
  // We'll shuffle this list in initState to randomize questions
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What was Java originally called?',
      'options': ['Maple', 'JavaScript', 'Oak', 'Spruce'],
      'answer': 'Oak', // Correct answer
    },
    {
      'question': 'Who is known as the creator of Java?',
      'options': [
        'Dennies Ritchie',
        'James Gosling',
        'Bjarne Stroustrup',
        'Guido van Rossum',
      ],
      'answer': 'James Gosling', // Correct answer
    },
    {
      'question': 'What year was Java Created?',
      'options': ['1990', '1992', '1995', '2000'],
      'answer': '1992', // Correct answer
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

  int _currentIndex = 0; // Tracks the current question index
  String?
  _selectedAnswer; // Stores the user's selected answer (null if nothing selected)
  int _score = 0; // Keeps track of the user's score

  @override
  void initState() {
    super.initState();
    // Shuffle the questions list when the widget is initialized
    // This ensures questions appear in a random order each time the quiz is opened
    _questions.shuffle();
  }

  // Function to handle moving to the next question or to results screen
  void _nextQuestion() {
    // Check if the selected answer is correct and update score
    if (_selectedAnswer == _questions[_currentIndex]['answer']) {
      _score++;
    }

    // If there are more questions, move to the next one
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++; // Move to next question
        _selectedAnswer = null; // Reset selected answer
      });
    } else {
      // If no more questions, navigate to the results screen
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

  @override
  // Main UI build method for the quiz screen
  Widget build(BuildContext context) {
    final current = _questions[_currentIndex]; // Get the current question

    return Scaffold(
      // Top app bar showing current question number
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
                // This is what the default back button does
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
                  // Removed const so it can have a non-const parent
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    // Added const here instead
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
        //title: Text('Question ${_currentIndex + 1}/${_questions.length}'),
        //automaticallyImplyLeading: true, // Disables the back button in app bar
      ),
      // Main content of the screen
      body: Padding(
        padding: const EdgeInsets.all(20), // Adds padding around the content
        child: SingleChildScrollView(
          // Wrap with a scrollable view
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
                  border: Border.all(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Display the current question text (centered)
                    Center(
                      child: Text(
                        //QUESTION
                        current['question'],
                        textAlign:
                            TextAlign.center, // Center-aligns the text content
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Adds vertical spacing

                    // Dynamically creates a list of option tiles based on current question options
                    // Alternative method for centering text in ListTiles
                    // This may be better if you want to preserve the ListTile's original layout
                    ...current['options'].map<Widget>((option) {
                      final isSelected = option == _selectedAnswer;
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          contentPadding:
                              EdgeInsets.zero, // Remove default padding
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  option,
                                  textAlign:
                                      TextAlign
                                          .center, // Center-aligns the text
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          tileColor: isSelected ? Colors.blue[100] : null,
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

                    const SizedBox(height: 20),

                    // Next button at the bottom center
                    Center(
                      child: ElevatedButton(
                        onPressed:
                            _selectedAnswer != null ? _nextQuestion : null,
                        child: const Text('Next'),
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

// Stateless widget for displaying the final quiz results
class ResultScreen extends StatelessWidget {
  final int score; // User's final score
  final int total; // Total number of questions

  // Constructor requiring score and total parameters
  const ResultScreen({super.key, required this.score, required this.total});

  @override
  // Build method for the results screen UI
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Complete')), // App bar with title
      // Center the score text in the middle of the screen
      body: Center(
        child: Text(
          'You scored $score out of $total!', // Displays the final score
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
