import 'package:DevQuiz/challenge/answer_widget/answer_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/awnsers_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget({Key? key, required this.question, required this.onSelected})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AwnsersModel answer(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 24),
          Text(widget.question.title, style: AppTextStyles.heading),
          SizedBox(height: 24),

          for (var i = 0; i < widget.question.awnsers.length; i++)
            AnswerWidget(
              disabled: indexSelected != -1,
              awnsersModel: answer(i),
              isSelected: indexSelected == i,
              onTap: (value) {
                indexSelected = i;

                Future.delayed(Duration(seconds: 1)).whenComplete(() {
                  widget.onSelected(value);
                });

                setState(() {});
              },
            ),

          ///operado de spread concatena lista ...
          ///
          // ...widget.question.awnsers
          //     .map((e) => AnswerWidget(
          //           title: e.title,
          //           isRight: e.isRight,
          //         ))
          //     .toList(),
        ],
      ),
    );
  }
}
