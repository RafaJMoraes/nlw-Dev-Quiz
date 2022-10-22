import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/shared/widgets/progress/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentoPage;
  final int lengthQuestions;

  const QuestionIndicatorWidget(
      {Key? key, required this.currentoPage, required this.lengthQuestions})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: AppColors.white,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Question $currentoPage'),
                Text(' de $lengthQuestions'),
              ],
            ),
            SizedBox(height: 15),
            ProgressIndicatorWidget(value: currentoPage / lengthQuestions)
          ],
        ),
      ),
    );
  }
}
