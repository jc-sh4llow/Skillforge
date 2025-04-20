import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // hides the debug banner
      home: Scaffold(
        backgroundColor: const Color(0xFF010B1E),
        appBar: AppBar(
          backgroundColor: const Color(0xFF010B1E), // still needed for AppBar itself
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Image.asset('images/logo.png', width: 45, height: 45),
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
        ),
        body: Column(
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
              color: Color(0xFFEF433A),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.2,
                child: const Center(
                  child: Text(
                    'Explore the essential building blocks of Java. This quiz covers the basics of writing and understanding Java code, including syntax, structure, and key concepts. It’s a great way to test your foundational knowledge before diving deeper into specific topics like variables and data types.',
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
              color: Color(0xFFEF433A),
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
                  const SizedBox(height: 16), // Spacing between items
                  Container(
                    width: double.infinity, // Fills the parent container width
                    padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                    decoration: BoxDecoration(
                      color: Color(0xFF111D33),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• ', style: TextStyle(fontSize: 16, color: Colors.white)),
                          Expanded(
                            child: Text(
                              'This quiz consists of multiple-choice and true/false questions.',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• ', style: TextStyle(fontSize: 16, color: Colors.white)),
                          Expanded(
                            child: Text(
                              'Carefully read each question before selecting your answer.',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• ', style: TextStyle(fontSize: 16, color: Colors.white)),
                          Expanded(
                            child: Text(
                              'Once you’re confident with your answers, click the Next button to go to the next question, or the Submit button to finish the quiz.',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF14ADFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                color: Color(0xFF00568D),
                                width: 1.5,
                              )
                            ),
                          ),
                          onPressed: () {
                            print('Custom button pressed!');//the start overlay thingy here
                          },
                          child: Text(
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
    );
  }
}
