import 'package:flutter/material.dart';
class AnswerButton extends StatelessWidget{
  final String answerText;
  final void Function() onTab;
  const AnswerButton({Key?key,required this.answerText,required this.onTab}):super(key: key);
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
        onPressed: onTab,
        style: ElevatedButton.styleFrom(

          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
            backgroundColor: Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )
        ),
        child:Text(answerText,textAlign: TextAlign.center,) );
  }
}