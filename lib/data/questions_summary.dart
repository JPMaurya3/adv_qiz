import 'package:flutter/cupertino.dart';

class QuestionsSummary extends StatelessWidget{
  final List<Map<String,Object>> summaryData;
  const QuestionsSummary({required this.summaryData,super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: summaryData.map((element){
        return Row(
          children: [
            // access the value of map
            Text(((element["question_index"] as int)+ 1).toString()),
            SizedBox(height:  5,),
            Expanded(
              child: Column(
                children: [
                  Text(element["question"].toString()),
                  SizedBox(height:  5,),
                  Text(element["user_answer"].toString()),
                  SizedBox(height:  5,),
                  Text(element["correct_answer"].toString()),
              
                ],
              ),
            )

          ],
        );
      }).toList(),
      // note ;-The argument type 'Iterable<Row>' can't be assigned to the parameter type 'List<Widget>'.
      // used toList to convert iterable
    );
  }
}