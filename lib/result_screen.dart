import 'package:adv_quiz/data/questions.dart';
import 'package:adv_quiz/quiz.dart';
import 'package:flutter/material.dart';

import 'data/questions_summary.dart';
import 'models/start_screen.dart';
class ResultScreen extends StatelessWidget {
  final void Function() onRestart;
  // passed the list of answer
  final List<String> chosenAnswers;
  final int ?currentQuestionsIndex;
   ResultScreen( { this.currentQuestionsIndex,required this.chosenAnswers,required this.onRestart,super.key});

  // method for chosen answer
  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary=[];
    for(int i =0 ; i<chosenAnswers.length; i++){
      summary.add({
        "question_index":i,
        'question':questions[i].text,
        // first index in list is correct answer
        "correct_answer":questions[i].answers[0],
        "user_answer" : chosenAnswers[i]
      });
    }
    return summary;
  }
  @override
  Widget build(BuildContext context) {
    // set value in variable
    final summaryData = getSummaryData();
    // where is used to filter list in based on original list
    // final correctAnswer = summaryData.map((data)=>data['user_answer']).length;
    final correctAnswer = summaryData.where((data){
      return
      data['user_answer'] == data['correct_answer'];
    }).length;
    return Scaffold(
      backgroundColor: Colors.purpleAccent.withOpacity(0.3),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/3,),
          Text("Your answered ${correctAnswer} out of  ${questions.length}",
            style:TextStyle(
              color: Colors.blue,
                fontWeight: FontWeight.w600,
            fontSize: 14,
              fontFamily: "Roboto"
            ) ,),
            SizedBox(height: 20,),
             QuestionsSummary(summaryData: summaryData,),
          // ListView.builder(
          //   padding: EdgeInsets.all(12),,
          //     itemCount: questions.length,
          //     shrinkWrap: true,
          //     itemBuilder: (BuildContext, index){
          //       return  Row(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           const SizedBox(width: 10,),
          //            Expanded(
          //              child: Container(
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(0),
          //               ),
          //               child: const Text(,style: TextStyle(
          //                   color: Colors.white
          //               ),),
          //                                  ),
          //            ),
          //           Expanded(
          //             flex: 4,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 commonText(text:questions[index].text ,color:Colors.white ,isFontSize: true),
          //                 commonText(text:"",color: Colors.purpleAccent,isFontSize: false),
          //                 commonText(text: "jaksk",color: Colors.blueAccent,isFontSize: false),
          //               ],
          //             ),
          //           ),
          //         ],
          //       );
          //     }),
            TextButton(onPressed: onRestart,
                child: Text("Restart",style: TextStyle(),))
        ],),
      ),
    );
  }

  Widget commonText({required String text ,required Color color, bool? isFontSize ,}){
    return Text(text,
      overflow: TextOverflow.visible,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: isFontSize!?14:10,
      color: color,
      ),);
  }
}
