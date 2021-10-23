
import 'package:flutter/material.dart';
import 'quiz.dart';
import 'Result.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
Color w=Colors.white;
Color b=Colors.black;
class _MyAppState extends State<MyApp> {


  bool isSwitched=false;

  int _totalscore = 0;
  int _questionIndex = 0;
  int num0 = 0, num1 = 0, num2 = 0;
  List<Map<String, Object>> _question = [
    {
      'questionText': 'What \'s your favorite color?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'Blue', 'score': 15},
        {'text': 'Yellow', 'score': 20},
      ]
    },
    {
      'questionText': 'What \'s your favorite Animal?',
      'answer': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Tiger', 'score': 10},
        {'text': 'Elephant', 'score': 17},
        {'text': 'Lion', 'score': 20},
      ]
    },
    {
      'questionText': 'What \'s your favorite Instructor?',
      'answer': [
        {'text': 'Mohamed', 'score': 10},
        {'text': 'Sara', 'score': 20},
        {'text': 'mai', 'score': 20},
        {'text': 'Mona', 'score': 10},
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
      num0 = 0;
      num1 = 1;
      num2 = 2;
    });
  }

  void answerQuestion(int score) {
    if (_questionIndex == 0)
      num0 = score;
    else if (_questionIndex == 1)
      num1 = score;
    else if (_questionIndex == 2) num2 = score;

    _totalscore += score;
    setState(() {
      _questionIndex += 1;
    });
    print("_questionIndex=$_questionIndex");
    print("num0=$num0");
    print("num1=$num1");
    print("num2=$num2");
    print("_totalscore=$_totalscore");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App",style: TextStyle(color: w),),
          actions: <Widget>[
            Switch(
              value: isSwitched,
              onChanged: (value){
               setState(() {
                 isSwitched=value;
                 print(isSwitched);
                 if(isSwitched==true){b=Colors.white; w=Colors.black;}
                 if(isSwitched==false){b=Colors.black; w=Colors.white;}
               });

              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.black,
            ),
          ],
        ),
        body: Container(
          color: w,
            width: double.infinity,
            child: _questionIndex < _question.length
                ? Quiz(_question, _questionIndex, answerQuestion)
                : Result(_resetQuiz, _totalscore)),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back,color: w,size: 40,),
          onPressed: () {
            if (_questionIndex == 1) _totalscore -= num0;
            if (_questionIndex == 2) _totalscore -= num1;
            if (_questionIndex == 3) _totalscore -= num2;

            setState(() {
              if (_questionIndex > 0) _questionIndex--;
            });
            print("_questionIndex=$_questionIndex");
            print("num0=$num0");
            print("num1=$num1");
            print("num2=$num2");
            print("_totalscore=$_totalscore");
          },
        ),
      ),
    );
  }
}
