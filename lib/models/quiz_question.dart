class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  // shuffle the list
 List<String> getShuffledAnswer(){
   // list of create a list from element
   final shuffleList = List.of(answers);
   shuffleList.shuffle();
   return shuffleList;
 }
}