import 'package:flutter/material.dart';

void main() {
  runApp(FakeTinderQuiz());
}

class FakeTinderQuiz extends StatelessWidget {
  const FakeTinderQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Tinder Quiz',
      home: QuizScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  List<Map<String, dynamic>> questions = [
    {'question': 'Flutter is made by Google?', 'correct': true},
    {'question': '2 + 2 = 5?', 'correct': false},
    {'question': 'The earth is flat?', 'correct': false},
    {'question': 'Dart is the language for Flutter?', 'correct': true},
  ];

  int currentIndex = 0;
  int score = 0;

  void swipeCard(bool answer) {
    bool correct = questions[currentIndex]['correct'];
    if (answer == correct) score++;

    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex >= questions.length) {
      return Scaffold(
        appBar: AppBar(title: Text('Quiz Complete')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your score: $score / ${questions.length}',
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                    score = 0;
                  });
                },
                child: Text('Restart Quiz'),
              ),
            ],
          ),
        ),
      );
    }

    Map<String, dynamic> currentQ = questions[currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text('Fake Tinder Quiz'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 300,
                child: Center(
                  child: Text(
                    currentQ['question'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                  onPressed: () => swipeCard(false),
                  child: Icon(Icons.close, size: 36),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                  onPressed: () => swipeCard(true),
                  child: Icon(Icons.check, size: 36),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text('Score: $score', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
