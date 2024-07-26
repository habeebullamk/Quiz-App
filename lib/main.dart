import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:quizy/qustionbank.dart';

QuestionBank qbank = QuestionBank();
void main() {
  runApp(Quizzy());
}

class Quizzy extends StatelessWidget {
  const Quizzy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Quizpage(),
        )),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  const Quizpage({super.key});

  @override
  State<Quizpage> createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List<Widget> ScoreKeeper = [];
  void checkanswer(bool userselected) {
    bool correctAnswer = qbank.getAnswer();
    setState(() {
      if (qbank.isFinished()==true){
        Alert(context: context,
        title: "Finished",
        desc: 'you are Completed sucessfully').show();

        qbank.reset();
        ScoreKeeper=[];
      }
      else{

        if (userselected == correctAnswer) {
        ScoreKeeper.add(Icon(
          Icons.done,
          color: Colors.green,
        ));
      } else {
        ScoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      qbank.nextQusetion();
        

      }


      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                qbank.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                checkanswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  checkanswer(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ),
        Row(
          children: ScoreKeeper,
        )
      ],
    );
  }
}
