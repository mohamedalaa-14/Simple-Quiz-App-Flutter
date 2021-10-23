import 'package:flutter/material.dart';
import 'main.dart';
class Result extends StatelessWidget {
  final VoidCallback q;
  final resultscore;

  String get resultphrase{
    String resulttext;
    if(resultscore >= 70){
      resulttext="you are awesome !";
    }else if(resultscore >=40 ){
      resulttext="pretty likable !";
    }else{
      resulttext="you are so Bad !";
    }

    return resulttext;
  }


  Result(this.q,this.resultscore);


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Your Score is $resultscore",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color: b),
          textAlign: TextAlign.center,
        ),
        Text(
          resultphrase,
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold,color: b),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text(
            "Restart The App",
            style: TextStyle(fontSize:30,color: Colors.blue),
          ),
          onPressed: q,
        )
      ],
    ));
  }
}
