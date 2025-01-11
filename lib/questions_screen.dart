import 'package:adv_quiz/data/questions.dart';
import 'package:flutter/material.dart';

import 'models/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String answer) onSelectedAnswer;
  const QuestionsScreen( {super.key,required this.onSelectedAnswer});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionsIndex = 0;

  void answerQuestion(String answer){
    widget.onSelectedAnswer(answer);
    setState(() {
      currentQuestionsIndex ++;
    });
  }
  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionsIndex];
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // in dart we can access data stored in object using .(dot notation)
          Text( currentQuestion.text,
            textAlign: TextAlign.center,
            style:   TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily:"Roboto",
                    fontSize: 20,
                    color: Colors.white)

          ),

          // Text("The questions ..."  ,
          //   style: TextStyle(color: Colors.white),
          // ),
          SizedBox(height: MediaQuery.of(context).size.height/20,),
          // create a button dynamically based on list
          ...currentQuestion.getShuffledAnswer().map((answer){
            return Padding(
              padding: const EdgeInsets.only(top: 8,bottom: 8), // Add vertical spacing
              child: AnswerButton(answerText: answer,
                  onTab: (){
                answerQuestion(answer);
                  }),
            );
            // we passed answerQuestion as value
          }),

        ],
      ),
    );
  }
}