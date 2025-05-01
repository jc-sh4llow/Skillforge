import 'package:flutter/material.dart';
import 'package:skillforge/aboutjava.dart';
import 'package:skillforge/splashscreen.dart';
import 'package:skillforge/lesson1.dart';
import 'package:skillforge/lesson2.dart';
import 'package:skillforge/lesson3.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF010B1E),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'Silkscreen',
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 20,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Silkscreen',
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 20,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      // Set the initial route to the SplashScreen
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}


// Create a separate HomeScreen widget that contains your original home content
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF010B1E),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // LOGO
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Image.asset('images/logo.png', width: 45, height: 45),
            ),


            //OPEN MENU
            Builder(
              builder:
                  (context) => InkWell(
                    //ALLOWS TO GO BACK TO MODULE MENU
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutJava(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: const Color(0xFF45B6FE),
                          width: 1,
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.menu, color: Color(0xFF45B6FE)),
                          SizedBox(width: 8),
                          Text(
                            'Open Menu',
                            style: TextStyle(
                              color: Color(0xFF45B6FE),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            ),


            //INFO BUTTON
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
      body: const HomePage(),
    );
  }
}


// Your original HomePage class
class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => HomePageState();
}


// The rest of your code remains the same...
class HomePageState extends State<HomePage> {
  String selectedItem = 'LESSON';
  String selectedSection = 'LESSON';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color(0xFFEF433A), width: 1),
                    bottom: BorderSide(color: Color(0xFFEF433A), width: 1),
                  ),
                ),
                child: Opacity(
                  opacity: 0.58,
                  child: Image.asset(
                    'images/sunset.jpg',
                    width: double.infinity,
                    height: 195,
                    fit: BoxFit.cover,
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "JAVA",
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'PressStart2P',
                        letterSpacing: 0.05 * 32,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Unlock your coding potential with Skill Forge, the ultimate mobile learning app that makes mastering Java programming fun, interactive, and effortless—start forging your skills today!",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13,
                        letterSpacing: 0.05 * 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildMenuButton('LESSON'),
                        buildMenuButton('QUIZ'),
                        buildMenuButton('MINI-PROJECT'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    buildSectionContent(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget buildMenuButton(String title) {
    bool isSelected = selectedItem == title;
    Color itemColor =
        isSelected ? const Color(0xFFEF433A) : const Color(0xFFB9A4A4);


    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = title;
          selectedSection = title;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              color: itemColor,
              fontFamily: 'Silkscreen',
              fontSize: 11,
              letterSpacing: 0.05 * 11,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 3,
            width: 60,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFEF433A) : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildSectionContent() {
    if (selectedSection == 'LESSON') {
      return Container(
        padding: const EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 300),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFFB9A4A4), width: 1),
        ),
        child: Column(
          children: [
            // Module 1
            ModuleExpansionTile(
              title: "MODULE 1",
              contentWidgets: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'In this module, you will learn the fundametals of java and master variables and data types—the core of every Java program! Learn how to store and manipulate data like a pro, setting the stage for powerful applications. ',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(height: 10),


                ListTile(
                  title: const Text("JAVA TECHNOLOGIES"),
                  titleTextStyle: const TextStyle(
                    color: Color(0xFFB9A4A4),
                    fontFamily: 'Silkscreen',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  trailing: const Icon(Icons.circle_outlined),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Mod1Part1(),
                      ),
                    );
                  },
                ),
                //PRINTING
                ListTile(
                  title: const Text("PRINTING"),
                  titleTextStyle: const TextStyle(
                    color: Color(0xFFB9A4A4),
                    fontFamily: 'Silkscreen',
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: const Icon(Icons.circle_outlined),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Mod1Part2(),
                      ),
                    );
                  },
                ),
                //READING INPUT
                ListTile(
                  title: const Text("READING INPUT"),
                  titleTextStyle: const TextStyle(
                    color: Color(0xFFB9A4A4),
                    fontFamily: 'Silkscreen',
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: const Icon(Icons.circle_outlined),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Mod1Part3(),
                      ),
                    );
                  },
                ),
              ],
            ),
            // Module 2
            ModuleExpansionTile(
              title: "MODULE 2",
              contentWidgets: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Test your knowledge of Java programming basics, including variables and data types. This quiz will challenge your understanding of how Java handles data, stores values, and executes fundamental operations. Whether you are a beginner or reviewing core concepts, this is a great way to strengthen your skills. Good luck!',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(height: 10),
                const ListTile(
                  title: Text("CONTROL STRUCTURES"),
                  titleTextStyle: TextStyle(
                    color: Color(0xFFB9A4A4),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  trailing: Icon(Icons.circle_outlined),
                ),
                const ListTile(
                  title: Text("METHODS AND FUNCTIONS"),
                  titleTextStyle: TextStyle(
                    color: Color(0xFFB9A4A4),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: Icon(Icons.circle_outlined),
                ),
                const ListTile(
                  title: Text("INTRODUCTION TO OOP"),
                  titleTextStyle: TextStyle(
                    color: Color(0xFFB9A4A4),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: Icon(Icons.circle_outlined),
                ),
              ],
            ),
          ],
        ),
      );
    } else if (selectedSection == 'QUIZ') {
      return Container(
        padding: const EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 300),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFFB9A4A4), width: 1),
        ),
        child: Column(
          children: [
            ModuleExpansionTile(
              title: "MODULE 1",
              contentWidgets: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'In this module, you will learn the fundametals of java and master variables and data types—the core of every Java program! Learn how to store and manipulate data like a pro, setting the stage for powerful applications. ',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(height: 10),
                const ListTile(
                  title: Text("FUNDAMENTALS OF JAVA PROGRAMMING"),
                  titleTextStyle: TextStyle(
                    color: Color(0xFFB9A4A4),
                    fontFamily: 'Silkscreen',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  trailing: Icon(Icons.circle_outlined),
                ),
                const ListTile(
                  title: Text("VARIABLES"),
                  titleTextStyle: TextStyle(
                    color: Color(0xFFB9A4A4),
                    fontFamily: 'Silkscreen',
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: Icon(Icons.circle_outlined),
                ),
                const ListTile(
                  title: Text("DATA TYPES"),
                  titleTextStyle: TextStyle(
                    color: Color(0xFFB9A4A4),
                    fontFamily: 'Silkscreen',
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: Icon(Icons.circle_outlined),
                ),
              ],
            ),


            // Module 2 content (different from Module 1)
            ModuleExpansionTile(
              title: "MODULE 2",
              contentWidgets: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Test your knowledge of Java programming basics, including variables and data types. This quiz will challenge your understanding of how Java handles data, stores values, and executes fundamental operations. Whether you are a beginner or reviewing core concepts, this is a great way to strengthen your skills. Good luck!',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(height: 10),
                const ListTile(
                  title: Text("CONTROL STRUCTURES"),
                  titleTextStyle: TextStyle(
                    color: Color(0xFFB9A4A4),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  trailing: Icon(Icons.circle_outlined),
                ),
                const ListTile(
                  title: Text("METHODS AND FUNCTIONS"),
                  titleTextStyle: TextStyle(
                    color: Color(0xFFB9A4A4),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: Icon(Icons.circle_outlined),
                ),
                const ListTile(
                  title: Text("INTRODUCTION TO OOP"),
                  titleTextStyle: TextStyle(
                    color: Color(0xFFB9A4A4),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: Icon(Icons.circle_outlined),
                ),
              ],
            ),
          ],
        ),
      );
    } else if (selectedSection == 'MINI-PROJECT') {
      return Container(
        padding: const EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 400),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFFB9A4A4), width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Simple Calculator",
              style: TextStyle(
                fontFamily: 'Silkscreen',
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(1, 1),
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF45B6FE),
                textStyle: const TextStyle(
                  fontFamily: 'Jersey10',
                  fontSize: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onPressed: () {},
              child: const Text("START"),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox(); // Empty by default
    }
  }
}


// Move ModuleExpansionTile class outside of HomePageState
class ModuleExpansionTile extends StatelessWidget {
  final String title;
  final List<Widget> contentWidgets;


  const ModuleExpansionTile({
    super.key,
    required this.title,
    required this.contentWidgets,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Silkscreen',
            letterSpacing: 5,
            fontSize: 30,
          ),
        ),
        children: contentWidgets,
      ),
    );
  }
}

