import 'package:flutter/material.dart';
import 'package:quiz/app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text("اختبار"),
          backgroundColor: Colors.grey,
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResult = [];

  void checkAnswer(bool whatUserPicked) {
    setState(() {
      bool? correctAnswer = appBrain.getQuestionAnswer();
      if (whatUserPicked == correctAnswer) {
        answerResult.add(const Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
      } else {
        answerResult.add(const Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ));
      }
      if (appBrain.isFinished() == true) {
        Alert(
            context: context,
            title: "Game Over",
            desc: "Finish your questions",
            buttons: [
              DialogButton(
                child: const Text('Reset'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]).show();
            appBrain.reset();
            answerResult=[];
      } else {
        appBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(appBrain.getQuestionImage()),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                appBrain.getQuestionText(),
                style: const TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: MaterialButton(
              color: Colors.indigo,
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text(
                'صح',
                style: TextStyle(fontSize: 22.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: MaterialButton(
              color: Colors.deepOrange,
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text(
                'خطأ',
                style: TextStyle(fontSize: 22.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
