import 'package:flutter/material.dart';
import 'quiz_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget bullet(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('• ', style: TextStyle(fontSize: 16, color: Colors.white)),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      ],
    );
  }

  void _navigateToQuizScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => QuizScreen()),
    );
  }

  // Method to navigate to the quiz screen
  /*void _navigateToQuizScreen(BuildContext context) {
     This will be implemented to navigate to the quiz screen when ready
     For now, just close the dialog to demonstrate it works
    print('Navigating to quiz screen...');
     You would replace this with actual navigation code
     For example: Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuizScreen()));
  }*/

  void _showStartQuizDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // This allows closing by clicking outside
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF111D33),
                    border: Border.all(color: const Color(0xFF14476A), width: 2),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Start the Quiz?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Silkscreen',
                        ),
                      ),
                      const SizedBox(height: 10),
                      bullet('This quiz will test your understanding of Java programming fundamentals.'),
                      const SizedBox(height: 10),
                      bullet("Make sure you're ready before starting."),
                      const SizedBox(height: 10),
                      bullet('Good luck!'),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF14ADFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      side: const BorderSide(
                        color: Color(0xFF00568D),
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 0),
                  ),
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(dialogContext).pop();
                    // Navigate to the quiz screen
                    _navigateToQuizScreen(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      'Start the Quiz',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Silkscreen',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(  // Add Builder here to get a proper context
        builder: (context) => Scaffold(
          backgroundColor: const Color(0xFF010B1E),
          appBar: AppBar(
            backgroundColor: const Color(0xFF010B1E),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Image.asset('assets/images/logo.png', width: 45, height: 45),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(5, 5, 15, 5),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: const Color(0xFF45B6FE), width: 1),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.close, color: Color(0xFF45B6FE)),
                      SizedBox(width: 8),
                      Text(
                        'Close',
                        style: TextStyle(
                          color: Color(0xFF45B6FE),
                          fontSize: 12,
                        ),
                      ),
                    ],
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
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.2,
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 2,
                  color: const Color(0xFFEF433A),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: const Center(
                    child: Text(
                      'Explore the essential building blocks of Java. This quiz covers the basics of writing and understanding Java code, including syntax, structure, and key concepts. It\'s a great way to test your foundational knowledge before diving deeper into specific topics like variables and data types.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 2,
                  color: const Color(0xFFEF433A),
                ),
                const SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    border: Border.all(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Instructions',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Silkscreen',
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                        decoration: BoxDecoration(
                          color: const Color(0xFF111D33),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            bullet('This quiz consists of multiple-choice and true/false questions'),
                            const SizedBox(height: 5),
                            bullet('Carefully read each question before selecting your answer.'),
                            const SizedBox(height: 5),
                            bullet('Once you\'re confident with your answers, click the Next button to go to the next question or the Submit button to finish the quiz.'),
                            const SizedBox(height: 50),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF14ADFF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(
                                      color: Color(0xFF00568D),
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  _showStartQuizDialog(context);
                                },
                                child: const Text(
                                  'Start',
                                  style: TextStyle(
                                    fontFamily: 'Silkscreen',
                                    fontSize: 16,
                                    color: Colors.white,
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
        ),
      ),
    );
  }
}