import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;

  final quiz = const [
    {
      'question': 'Quel widget represente un etat immuable ?',
      'answers': [
        {'answer': 'StatelessWidget', 'correct': true},
        {'answer': 'StatefulWidget', 'correct': false},
        {'answer': 'InheritedWidget', 'correct': false},
      ],
    },
    {
      'question': 'Quelle methode declenche la reconstruction d\'un StatefulWidget ?',
      'answers': [
        {'answer': 'build()', 'correct': false},
        {'answer': 'setState()', 'correct': true},
        {'answer': 'initState()', 'correct': false},
      ],
    },
    {
      'question': 'Quel widget permet un menu lateral ?',
      'answers': [
        {'answer': 'Drawer', 'correct': true},
        {'answer': 'AppBar', 'correct': false},
        {'answer': 'BottomSheet', 'correct': false},
      ],
    },
  ];

  void handleAnswer(Map<String, Object> answer) {
    setState(() {
      if (answer['correct'] == true) ++score;
      ++currentQuestionIndex;
    });
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: (currentQuestionIndex >= quiz.length)
          ? Score(score: score, total: quiz.length, onRestart: resetQuiz)
          : SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Question(
                    text: quiz[currentQuestionIndex]['question'] as String,
                    index: currentQuestionIndex,
                    total: quiz.length,
                  ),
                  ...(quiz[currentQuestionIndex]['answers'] as List)
                      .cast<Map<String, Object>>()
                      .map((answer) => Answer(answer: answer, onSelected: handleAnswer)),
                ],
              ),
            ),
    );
  }
}

class Question extends StatelessWidget {
  final String text;
  final int index;
  final int total;

  const Question({super.key, required this.text, required this.index, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${index + 1}/$total', style: const TextStyle(fontSize: 20)),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(text, style: const TextStyle(fontSize: 18), textAlign: TextAlign.center),
        ),
      ],
    );
  }
}

class Answer extends StatelessWidget {
  final Map<String, Object> answer;
  final void Function(Map<String, Object>) onSelected;

  const Answer({super.key, required this.answer, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
        onPressed: () => onSelected(answer),
        child: Align(alignment: Alignment.centerLeft, child: Text(answer['answer'] as String)),
      ),
    );
  }
}

class Score extends StatelessWidget {
  final int score;
  final int total;
  final VoidCallback onRestart;

  const Score({super.key, required this.score, required this.total, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Score : ${(score / total * 100).round()} %', style: const TextStyle(fontSize: 22)),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: onRestart, child: const Text('Recommencer')),
        ],
      ),
    );
  }
}
