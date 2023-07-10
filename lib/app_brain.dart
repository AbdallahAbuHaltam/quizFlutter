import 'package:quiz/question.dart';

class AppBrain {
  int _questionNumber = 0;

  final List<Questions> _questionGroup = [
    Questions(
        questionText: "عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب؟",
        questionImage: 'images/image-1.jpg',
        questionAnswer: true),
    Questions(
        questionText: "القطط هي حيوانات محبة للحم؟",
        questionImage: 'images/image-2.jpg',
        questionAnswer: true),
    Questions(
        questionText: "الصين موجودة في القارة الافريقية",
        questionImage: 'images/image-3.jpg',
        questionAnswer: false),
    Questions(
        questionText: "الارض مسطحة وليست كروية؟",
        questionImage: 'images/image-4.jpg',
        questionAnswer: false),
  ];

  String getQuestionText() {
    return _questionGroup[_questionNumber].questionText.toString();
  }

  String getQuestionImage() {
    return _questionGroup[_questionNumber].questionImage.toString();
  }

  bool? getQuestionAnswer() {
    return _questionGroup[_questionNumber].questionAnswer;
  }
  void nextQuestion(){
    if(_questionNumber <_questionGroup.length -1){
      _questionNumber++;
    }
  }
  bool isFinished(){
    if(_questionNumber>_questionGroup.length-1){
      return true;
    }
    else{
      return false;
    }
    
  }
  void reset(){
    _questionNumber=0;
  }
}
